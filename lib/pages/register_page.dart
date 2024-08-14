import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  
  const RegisterPage({
    super.key,
    required this.onTap,
    });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // text editin controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  void register() async{
    // get auth service
    final _authService = AuthService();

    // check if passwords match -> create user
    if (_passController.text == _confirmPassController.text){
      // try creating user
      try{
        await _authService.signUpWithEmailAndPassord(
        _emailController.text, 
        _passController.text
      );
      // display any errors
      } catch (e){
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    // if passwords don't match -> show error
    else{
      showDialog(
          context: context, 
          builder: (context) => const AlertDialog(
            title:   Text("Password don't match"),
          ),
        );
    }
  }


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
              "Let's create an account for you",
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
            
            // confirm password textfield
             MyTextfield(
              controller: _confirmPassController, 
              hintText: "Confirm password", 
              obscureText: true
            ),

            const SizedBox(height: 10,),

            // sign in button

            MyButton(
              onTap: () => register(), 
              text: "Sign Up"
            ),

            const SizedBox(height: 25,),
        
            // already have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: theme.inversePrimary
                  ),
                ),
                
                const SizedBox(width: 4,),
                
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login here",
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