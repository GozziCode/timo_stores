import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
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
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Your order has been saved',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Click return home to go back to homepage',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Comlete Checkout',
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
