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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              Image.asset(
                widget.product.img,
                fit: BoxFit.cover,
                height: size.height * .44,
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
          const SizedBox(height: 10),
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
                      width: size.width * .70,
                      child: Text(
                        widget.product.name,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: size.height * .032,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '\$${widget.product.price}',
                      style: TextStyle(
                          fontSize: size.height * .028,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                            style: TextStyle(
                                fontSize: size.height * .025,
                                fontWeight: FontWeight.w500),
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
                  height: 5,
                ),
                const Text(
                  'Select Color:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: size.height * .04,
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
                          // height: size.height*.015,
                          width: size.width * .08,
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
                const SizedBox(height: 10),
                Text(
                  widget.product.description, softWrap: true, maxLines: 4,
                  // textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: size.height * .018,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: size.height * .07,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.product.sizes.length,
                itemBuilder: (context, index) {
                  final sizeSelected = widget.product.sizes[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSize = sizeSelected;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: size.width * 0.14,
                      decoration: BoxDecoration(
                          color: _selectedSize == sizeSelected
                              ? Colors.black
                              : Colors.transparent,
                          border: Border.all(color: Colors.grey),
                          shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          sizeSelected,
                          style: TextStyle(
                              fontSize: 20,
                              color: _selectedSize == sizeSelected
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
              height: size.height * .07,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addItem,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
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
