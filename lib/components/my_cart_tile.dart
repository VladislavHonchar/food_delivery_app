import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  
  const MyCartTile({
    super.key,
    required this.cartItem,
    });

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: theme.secondary,
          borderRadius: BorderRadius.circular(8)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(cartItem.food.imagePath,
                    height: 100,
                    width: 100,
                    ),
                  ),
              
                  const SizedBox(width: 10,),
                  // food name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(cartItem.food.name),
                      // food price
                      Text('\$${cartItem.food.price}',
                        style: TextStyle(
                          color: theme.primary
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),
              
                  // increment or decrement quantity
                  MyQuantitySelector(
                    quantity: cartItem.quantity, 
                    food: cartItem.food, 
                    onIncrement: () {
                      restaurant.addToCart(
                        cartItem.food, 
                        cartItem.selectedAddons
                      );
                    }, 
                    onDecrement: (){
                      restaurant.removeFromCart(cartItem);
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                padding: const EdgeInsets.only(left: 10, right: 10),
                scrollDirection: Axis.horizontal,
                children: cartItem.selectedAddons
                .map((addon) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                      label: Row(
                        children: [
                          // addon name
                          Text(addon.name),
                  
                          // addon price
                          Text(" (\$${addon.price})"),
                        ],
                      ), 
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: theme.primary
                        )
                      ),
                      onSelected: (value){},
                      backgroundColor: theme.secondary,
                      labelStyle: TextStyle(
                        color: theme.inversePrimary,
                        fontSize: 12,
                      ),
                    ),
                ))
                  .toList(),
              ),
            )

            // addons
          ],
        ),
      ),
    );
  }
}