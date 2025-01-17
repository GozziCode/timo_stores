import 'package:flutter/material.dart';

AppBar homeAppBar(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "Timo",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size.height * .03,
        ),
      ),
    ),
    leadingWidth: double.infinity,
    elevation: 0,
    backgroundColor: Colors.grey[200],
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            IconButton(
                onPressed: () async {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                )),
            IconButton(
                onPressed: () async {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.deepOrange,
                  size: 30,
                ))
          ],
        ),
      )
    ],
  );
}
