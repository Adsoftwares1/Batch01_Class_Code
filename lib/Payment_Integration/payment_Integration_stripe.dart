import 'package:flutter/material.dart';
import 'package:practice_app_class/Payment_Integration/paymen_checkout_web.dart';

class FlutterStripeIntegration extends StatefulWidget {
  const FlutterStripeIntegration({super.key});

  @override
  State<FlutterStripeIntegration> createState() =>
      _FlutterStripeIntegrationState();
}

class _FlutterStripeIntegrationState extends State<FlutterStripeIntegration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                redirectToCheckout(context);
                print("payment is hitted");
              },
              child: Container(
                width: 200,
                height: 60,
                color: Colors.lightBlue,
                child: Center(
                  child: Text("Payment"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
