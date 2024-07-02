import 'package:flutter/material.dart';
import 'package:timo_stores/home/model/product_model.dart';
import 'package:timo_stores/home/screens/detail_screen.dart';

class AllProduct extends StatelessWidget {
  final Size size;
  const AllProduct({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 0.3,
        childAspectRatio: 0.55,
      ),
      itemCount: dummyProducts.length,
      itemBuilder: (BuildContext context, int index) {
        final products = dummyProducts[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductContainer(
            product: products,
            size: size,
          ),
        );
      },
    );
  }
}

class ProductContainer extends StatelessWidget {
  final ProductModel product;
  final Size size;
  const ProductContainer({
    super.key,
    required this.product,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(
                    product: product,
                  ))),
          child: Container(
            height: size.height * .26,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      product.img,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey),
            child: Stack(
              children: [
                Positioned(
                  right: 10,
                  top: 5,
                  child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: product.isBestSeller
                              ? Colors.deepOrange
                              : Colors.white),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            product.isBestSeller
                                ? Icons.favorite
                                : Icons.favorite_outline_rounded,
                            color: product.isBestSeller
                                ? Colors.white
                                : Colors.deepOrange,
                          ))),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          product.name,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: size.height * 0.014),
        ),
        Text(
          "\$${product.price}",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: size.height * 0.02),
        ),
      ],
    );
  }
}
