import 'package:flutter/material.dart';

class CustomAddRemoveButton extends StatelessWidget {
  final void Function()? removeItem;
  final void Function()? addItem;
  final String quantity;
  const CustomAddRemoveButton({
    super.key,
    this.removeItem,
    this.addItem,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  width: 130,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: removeItem,
                          splashColor: Colors.deepOrangeAccent,
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        Text(quantity,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        InkWell(
                          onTap: addItem,
                          splashColor: Colors.deepOrangeAccent,
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                '+',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      ]),
                );
  }
}
