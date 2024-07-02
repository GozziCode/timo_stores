import 'package:flutter/material.dart';

class PrroductWidgetHolder extends StatelessWidget {
  final String text;
  const PrroductWidgetHolder({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text(text));
  }
}
