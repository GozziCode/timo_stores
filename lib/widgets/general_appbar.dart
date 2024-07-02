import 'package:flutter/material.dart';

AppBar generalAppBar(
    {required BuildContext context, required String title, IconData? icon}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    ),
    centerTitle: true,
    // toolbarHeight: 80,
    leadingWidth: double.infinity,
    elevation: 0,
    backgroundColor: Colors.grey[200],
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [Icon(icon)],
        ),
      )
    ],
  );
}
