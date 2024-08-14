import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_current_location.dart';
import 'package:food_delivery_app/components/my_description_box.dart';
import 'package:food_delivery_app/components/my_drawer.dart';
import 'package:food_delivery_app/components/my_food_tile.dart';
import 'package:food_delivery_app/components/my_sliver_app_bar.dart';
import 'package:food_delivery_app/components/my_tab_bar.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  // tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategories.values.length, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategories category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of food in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategories.values.map((category){
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      
      return ListView.builder(
        itemCount: categoryMenu.length,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // return food tile
          return MyFoodTile(
            food: categoryMenu[index], 
            onTap: () => Navigator.push(context, 
            MaterialPageRoute(builder: (context) => FoodPage(food: categoryMenu[index]))),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(
              tabController: _tabController,
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25, 
                  endIndent: 25, 
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // my current location
                 const MyCurrentLocation(),
                
                // description box
                const MyDescriptionBox(),
              ],
            ), 
          ),
        ], 
        body: Consumer<Restaurant>(
          builder: (context, value, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(value.menu),
          ), 
        ),
      ),
    );
  }
}