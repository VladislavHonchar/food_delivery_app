import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_tile.dart';
import 'package:food_delivery_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: theme.surface,
      child:  Column(
        children: [
          // logo 
          DrawerHeader(
            child: Icon(
              Icons.music_note, 
              size: 40,
              color: theme.inversePrimary,
              )
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Divider(
                color: theme.secondary,
              ),
            ),
          
          // home tile
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home, 
            onTap: () => Navigator.pop(context),
          ),

          // settings tile
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings, 
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const SettingsPage() 
                )
              );
            }
          ),

          const Spacer(),

          // logout tile
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout, 
            onTap: (){}
          ),

          const SizedBox(height: 25,),
        ],
      ),
    );
  }
}