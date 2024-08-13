import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restuarant, child) {
        // cart
        final userCart = restuarant.cart;
        
        // theme
        final theme = Theme.of(context).colorScheme;

        // scaffold UI
        return Scaffold(
          backgroundColor: theme.surface,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: theme.inversePrimary,
            actions: [
              // clear all cart
              IconButton(
                onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure you want to clear th cart"),
                      actions: [
                        // cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context), 
                          child: const Text("Cancel")
                        ),

                        // yes button
                        TextButton(
                          onPressed: () { 
                            Navigator.pop(context);
                            restuarant.clearCart();
                          }, 
                          child: const Text("Yes")
                        ),
                      ],
                    ),
                  );
                }, 
                icon: const Icon(Icons.delete)
              ),
            ],
          ),
          body: Column(
            children: [

              // list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty 
                    ? const Expanded(
                      child: Center(
                        child: Text("Your cart is empty"),
                      ),
                    ) 
                    : Expanded(
                      child: ListView.builder(
                        itemCount:  userCart.length,
                        itemBuilder: (context, index) {
                
                          // get individual cart item
                          final cartItem = userCart[index];
                          
                          // return cart tile UI
                          return MyCartTile(cartItem: cartItem);
                        }
                        ),
                      ),
                  ],
                ),
              ),

              // button to pay
              MyButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
                  )
                ), 
                text: "Go to checkout"
              ),

              const SizedBox(height: 25,),
            ],
          ),
        );
      },
    );
  }
}