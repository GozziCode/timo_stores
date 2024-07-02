import 'package:flutter/material.dart';

import '../model/cart_model.dart';
import '../widget/cart_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: size.height * .55,
          child: Cart.items.isEmpty
              ? const Center(
                  child: Text(
                    'No item added to cart yet',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: Cart.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final cartItem = Cart.items[index];
                    return CartCard(
                      cartItem: cartItem,
                      remove: () {
                        setState(() {
                          Cart.items.removeAt(index);
                        });
                      },
                    );
                  }),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          height: size.height * .22,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: size.height * .019),
                  ),
                  Text(
                    '\$${Cart.subtotal}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * .019,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Voucher',
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: size.height * .019),
                  ),
                  Text(
                    '\$0.00',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: size.height * .019,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery',
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: size.height * .019),
                  ),
                  Text(
                    '\$0.0',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * .019,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Cost',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * .020,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${Cart.subtotal}',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: size.height * .020,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: size.height * .07,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Cart.clear(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  child: const Text(
                    'Comlete Checkout',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
