import 'package:flutter/material.dart';

class GeneralWidgetHolder extends StatelessWidget {
  final String text;
  const GeneralWidgetHolder({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 350,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
