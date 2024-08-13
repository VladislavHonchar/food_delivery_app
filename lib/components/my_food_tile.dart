import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  
  const MyFoodTile({
    super.key,
    required this.food,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                
                // text food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        '\$' + food.price.toString(), 
                        style: TextStyle(
                          color: theme.primary
                        ),
                      ),
                      Text(
                        food.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                          color: theme.inversePrimary,

                        ),
                      ),
                    ],
                  )
                ),

                const SizedBox(width: 15,),
            
                // food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    food.imagePath, 
                    height: 120, 
                    width: 120,
                  )
                ),
                
              ],
            ),
          ),
        ),
        Divider(
          color: theme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}