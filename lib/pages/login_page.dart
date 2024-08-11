import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({
    super.key,
    required this.onTap,
    });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // text editin controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: theme.surface,
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: theme.inversePrimary,

            ),

            const SizedBox(height: 25,),

            // message, app slogan

            Text(
              "Food Delivery App",
              style: TextStyle(
                fontSize: 16,
                color: theme.inversePrimary
              ),
            ),

              const SizedBox(height: 25,),
        
            // email textfield
            MyTextfield(
              controller: _emailController, 
              hintText: "Email", 
              obscureText: false
            ),

            const SizedBox(height: 10,),

            // password textfield
             MyTextfield(
              controller: _passController, 
              hintText: "Password", 
              obscureText: true
            ),

            const SizedBox(height: 10,),

            // sign in button

            MyButton(
              onTap: () {}, 
              text: "Sign In"
            ),

            const SizedBox(height: 25,),
        
            // not a member ? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: theme.inversePrimary
                  ),
                ),
                
                const SizedBox(width: 4,),
                
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      color: theme.inversePrimary,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
