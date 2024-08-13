import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;
  
  // user wants to pay
  void userTappedPay (){
    if (formKey.currentState!.validate()){
      // only show dialog if form is valid
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder name: $cardHolderName"),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [

            // cancel button
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Cancel")
            ),

            // confirm button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator. push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliveryProgressPage(),
                )
                );
              },
              child: const Text("Confirm")
            ),
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: theme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          // credit card
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: showBackView, 
            onCreditCardWidgetChange: (p0){
              
            }
          ),

          // credit card form
          CreditCardForm(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            }, 
            formKey: formKey
          ),
          const Spacer(),

          MyButton(
            onTap: userTappedPay, 
            text: "Pay now"
          ),

          const SizedBox( height: 25,),
          
        ],
      ),
    );
  }
}