import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  
  final Widget child;
  final Widget title;
  
  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SliverAppBar(
      expandedHeight: 320,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      centerTitle: true,
      actions: [
        // cart button
        IconButton(
          onPressed: () => 
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const CartPage(),
              )
          ), 
          icon: const Icon(Icons.shopping_cart
          ),
        ),
      ],
      backgroundColor: theme.surface,
      foregroundColor: theme.inversePrimary,
      title: const Text("Sunset Diner"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}