import 'package:flutter/material.dart';
import 'package:timo_stores/cart/screens/order_success_screen.dart';

import '../../home/model/product_model.dart';

class CartItem {
  final ProductModel product;
  int quantity;
  Color? selectedColor;
  String? selectedSize;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedColor,
    this.selectedSize,
  });
}

class Cart {
  static final List<CartItem> _items = [];

  static List<CartItem> get items => _items;

  static double get subtotal => _items.fold(0,
      (total, item) => total + (int.parse(item.product.price) * item.quantity));

  static void addItem(ProductModel product, {Color? color, String? size}) {
    var existingItem = _items.firstWhere(
      (item) =>
          item.product == product &&
          item.selectedColor == color &&
          item.selectedSize == size,
      orElse: () =>
          CartItem(product: product, selectedColor: color, selectedSize: size),
    );

    if (_items.contains(existingItem)) {
      existingItem.quantity++;
    } else {
      _items.add(existingItem);
    }
  }

  static void removeItem(ProductModel product, {Color? color, String? size}) {
    var existingItem = _items.firstWhere(
      (item) =>
          item.product == product &&
          item.selectedColor == color &&
          item.selectedSize == size,
      orElse: () =>
          CartItem(product: product, selectedColor: color, selectedSize: size),
    );

    if (_items.contains(existingItem)) {
      if (existingItem.quantity > 1) {
        existingItem.quantity--;
      } else {
        _items.remove(existingItem);
      }
    }
  }

  static void clear(BuildContext context) {
    _items.clear();
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const OrderSuccessScreen()));
  }
}
