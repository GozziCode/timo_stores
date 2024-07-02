import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * .30,
              width: size.width * .30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green),
              child: const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            Text(
              'Your order has been saved',
              style: TextStyle(
                  fontSize: size.height * .03, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Click return back to go back to previous page',
              style: TextStyle(fontSize: size.height * .02),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: size.height * .066,
              width: size.width * .7,
              child: ElevatedButton(
                onPressed: ()=> Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Return back',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 22,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
