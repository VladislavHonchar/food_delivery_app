import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawerTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        title: Text(
          text, 
          style: TextStyle(
            color: theme.inversePrimary,
          ),
        ),
        leading: Icon(
          icon,
          color: theme.inversePrimary,
        ),
        onTap: onTap,
      ),
    );
  }
}