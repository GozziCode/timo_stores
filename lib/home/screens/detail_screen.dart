import 'package:flutter/material.dart';
import 'package:timo_stores/home/model/product_model.dart';
import 'package:timo_stores/widgets/customaddremovebutton.dart';

import '../../cart/model/cart_model.dart';

class DetailScreen extends StatefulWidget {
  final ProductModel product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _quantity = 0;
  Color? _selectedColor;
  String? _selectedSize;

  void _addItem() {
    if (_selectedColor != null && _selectedSize != null) {
      setState(() {
        _quantity++;
      });
      Cart.addItem(widget.product, color: _selectedColor, size: _selectedSize);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An item was added to your cart'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a color and size before adding to cart'),
        ),
      );
    }
  }

  void _removeItem() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
      Cart.removeItem(widget.product,
          color: _selectedColor, size: _selectedSize);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An item was removed from your cart'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.product.listedColors.isNotEmpty
        ? widget.product.listedColors[0]
        : null;
    _selectedSize =
        widget.product.sizes.isNotEmpty ? widget.product.sizes[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              Image.asset(
                widget.product.img,
                fit: BoxFit.cover,
                height: 450,
                width: double.infinity,
              ),
              Positioned(
                top: 60,
                left: 20,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 22,
                      )),
                ),
              ),
              Positioned(
                top: 60,
                right: 20,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 22,
                      )),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Text(
                        widget.product.name,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '\$${widget.product.price}',
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.product.rating,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    CustomAddRemoveButton(
                      quantity: '$_quantity',
                      addItem: _addItem,
                      removeItem: _removeItem,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Select Color:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product.listedColors.length,
                    itemBuilder: (context, index) {
                      final color = widget.product.listedColors[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColor = color;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _selectedColor == color
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  widget.product.description, softWrap: true, maxLines: 4,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.product.sizes.length,
                itemBuilder: (context, index) {
                  final size = widget.product.sizes[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSize = size;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: _selectedSize == size
                              ? Colors.black
                              : Colors.transparent,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          size,
                          style: TextStyle(
                              fontSize: 24,
                              color: _selectedSize == size
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Spacer(),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              height: 75,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addItem,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  backgroundColor: Colors.deepOrange,
                ),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ))
        ],
      ),
    );
  }
}
