import 'package:flutter/material.dart';

class PrroductWidgetHolder extends StatelessWidget {
  final String text;
  const PrroductWidgetHolder({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only (left: 50, top: 90),
      child: Text(text),
    );
  }
}
