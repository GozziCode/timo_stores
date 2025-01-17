import 'package:flutter/material.dart';

import '../../widgets/customaddremovebutton.dart';
import '../model/cart_model.dart';

class CartCard extends StatefulWidget {
  final CartItem cartItem;
  final VoidCallback remove;
  const CartCard({
    super.key,
    required this.cartItem,
    required this.remove,
  });

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .22,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.cartItem.product.img,
                width: size.width * .22,
              )),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * .422,
                    child: Text(
                      widget.cartItem.product.name,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.022),
                    ),
                  ),
                  IconButton(
                      onPressed: widget.remove, icon: const Icon(Icons.delete, color: Colors.red,))
                ],
              ),
              const SizedBox(height: 5),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'Size: ', style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: '${widget.cartItem.selectedSize}',
                    style: const TextStyle(color: Colors.black))
              ])),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text('Color: ', style: TextStyle(color: Colors.grey)),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 20,
                    width: 30,
                    decoration: BoxDecoration(
                      color: widget.cartItem.selectedColor,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.grey,
                        width: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAddRemoveButton(
                    quantity: '${widget.cartItem.quantity}',
                    addItem: () {
                      setState(() {
                        Cart.addItem(widget.cartItem.product,
                            color: widget.cartItem.selectedColor,
                            size: widget.cartItem.selectedSize);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('An item was added to your cart'),
                        ),
                      );
                    },
                    removeItem: () {
                      setState(() {
                        Cart.removeItem(widget.cartItem.product,
                            color: widget.cartItem.selectedColor,
                            size: widget.cartItem.selectedSize);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('An item was removed from your cart'),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: size.width * 0.12,
                  ),
                  Text(
                    '\$${widget.cartItem.product.price}',
                    style: TextStyle(
                        fontSize: size.height * .025,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
