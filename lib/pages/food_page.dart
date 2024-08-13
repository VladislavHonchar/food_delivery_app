import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    // initialize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  bool _isExpanded = false;

  void _expandText() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  // method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddon){
  
    // close the current food page to go back to menu
    Navigator.pop(context);

    // format the selected addons
    List<Addon> curentlySelectedAddons = [];
    for(Addon addon in widget.food.availableAddons ){
      if(widget.selectedAddons[addon] == true){
        curentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, curentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Stack(children: [
      // Scaffold UI

      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // food image
              Image.asset(
                widget.food.imagePath,
              ),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // food name
                    Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    // food price
                    Text(
                      "\$${widget.food.price.toString()}",
                      style: TextStyle(fontSize: 16, color: theme.primary),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // food description
                    GestureDetector(
                      onTap: _expandText,
                      child: Text(
                        widget.food.description,
                        maxLines: _isExpanded ? null : 4,
                        overflow: _isExpanded ? null : TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, color: theme.primary),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Divider(
                      color: theme.secondary,
                    ),

                    // addons

                    Text(
                      "Add-ons",
                      style: TextStyle(
                        color: theme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: theme.tertiary,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.food.availableAddons.length,
                        itemBuilder: (context, index) {
                          // get individual addon
                          Addon addon = widget.food.availableAddons[index];
                          return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                '\$${addon.price}',
                                style: TextStyle(
                                  color: theme.primary,
                                ),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) => {
                                    setState(() {
                                      widget.selectedAddons[addon] = value!;
                                    })
                                  });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // button -> add to cart

              MyButton(
                onTap: () => addToCart(widget.food, widget.selectedAddons), 
              text: "Add to cart"
              ),

              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),

      // back button
      SafeArea(
        child: Opacity(
          opacity: 0.6,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: theme.secondary,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context), 
              icon: const Icon(Icons.arrow_back_ios_new_rounded)
              ),
          ),
        ),
      )
    ]);
  }
}
