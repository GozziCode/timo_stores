import 'package:flutter/material.dart';

class ProductModel {
  final String img;
  final String name;
  final String price;
  final String description;
  final bool isBestSeller;
  final List<Color> listedColors;
  final String rating;
  final List<String> sizes;

  ProductModel({
    required this.rating,
    required this.listedColors,
    required this.sizes,
    required this.img,
    required this.name,
    required this.price,
    required this.description,
    required this.isBestSeller,
  });
}

List<ProductModel> dummyProducts = [
  ProductModel(
      listedColors: [Colors.green, Colors.red, Colors.black],
      sizes: ['S', 'M', 'L', 'XL', 'XXL'],
      img: 'assets/images/product1.jpg',
      name: '"Risk Owen Jacket"',
      price: '800',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum nisi quis eleifend quam adipiscing vitae proin. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. Quis blandit turpis cursus in hac.',
      isBestSeller: false,
      rating: '4.6'),
  ProductModel(
      listedColors: [Colors.green, Colors.white, Colors.black],
      sizes: ['S', 'M', 'XL', 'XXL'],
      img: 'assets/images/product2.jpg',
      name: 'AlRism Cotton Short Sleeve Set',
      price: '389',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Iaculis eu non diam phasellus. Sit amet est placerat in egestas erat imperdiet. Rhoncus est pellentesque elit ullamcorper dignissim cras. Neque egestas congue quisque egestas diam in arcu. Integer vitae justo eget magna fermentum.',
      isBestSeller: false,
      rating: '5.0'),
  ProductModel(
      listedColors: [Colors.blue, Colors.red, Colors.black],
      sizes: ['S', 'M', 'L', 'XL', 'XXL'],
      img: 'assets/images/product3.jpg',
      name: 'Product 3',
      price: '800',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu dui vivamus arcu felis bibendum. Accumsan sit amet nulla facilisi morbi. Adipiscing at in tellus integer. Ac tortor vitae purus faucibus ornare suspendisse sed. Sapien faucibus et molestie ac feugiat sed lectus.',
      isBestSeller: false,
      rating: '3.6'),
  ProductModel(
      listedColors: [
        Colors.orange,
        Colors.red,
        Colors.black
      ],
      sizes: [
        'S',
        'M',
        'L',
        'XL',
      ],
      img: 'assets/images/product4.jpg',
      name: 'Product 4',
      price: '900',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit ut aliquam purus sit amet luctus. Odio aenean sed adipiscing diam. Duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat. Magna sit amet purus gravida quis blandit.',
      isBestSeller: true,
      rating: '2.7'),
  ProductModel(
      listedColors: [Colors.green, Colors.grey, Colors.black],
      sizes: ['S', 'M', 'L', 'XL', 'XXL'],
      img: 'assets/images/product5.jpg',
      name: 'Product 5',
      price: '800',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu consequat ac felis donec. Orci nulla pellentesque dignissim enim sit amet venenatis urna cursus. Adipiscing commodo elit at imperdiet dui accumsan sit amet nulla. Dolor magna eget est lorem ipsum dolor sit.',
      isBestSeller: true,
      rating: '3.5'),
  ProductModel(
      listedColors: [Colors.green, Colors.pink, Colors.purple],
      sizes: ['M', 'L', 'XL', 'XXL'],
      img: 'assets/images/product6.jpg',
      name: 'Product 6',
      price: '1000',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt. Vitae tortor condimentum lacinia quis vel eros. Laoreet non curabitur gravida arcu.',
      isBestSeller: false,
      rating: '5.0'),
  ProductModel(
      listedColors: [
        Colors.green,
        Colors.cyan,
        Colors.black,
      ],
      sizes: [
        'S',
        'M',
        'L',
        'XL',
        'XXL'
      ],
      img: 'assets/images/product7.jpg',
      name: 'Product 7',
      price: '2300',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Semper quis lectus nulla at volutpat diam. Varius quam quisque id diam vel quam elementum. Sit amet nisl suscipit adipiscing bibendum est.',
      isBestSeller: true,
      rating: '2.9'),
  ProductModel(
      listedColors: [
        Colors.green,
        Colors.pinkAccent,
        Colors.black,
      ],
      sizes: [
        'S',
        'L',
        'XXL'
      ],
      img: 'assets/images/product8.jpg',
      name: 'Product 8',
      price: '1200',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Augue mauris augue neque gravida. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien. Pulvinar mattis nunc sed blandit libero volutpat sed cras ornare.',
      isBestSeller: false,
      rating: '5.0'),
  ProductModel(
      listedColors: [Colors.green, Colors.red, Colors.black],
      sizes: ['S', 'M', 'L', 'XXL'],
      img: 'assets/images/product9.jpg',
      name: 'Product 9',
      price: '1800',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pellentesque habitant morbi tristique senectus et netus et. Interdum varius sit amet mattis vulputate enim nulla. Tempus urna et pharetra pharetra massa massa ultricies.',
      isBestSeller: true,
      rating: '3.8'),
  ProductModel(
      listedColors: [
        Colors.green,
        Colors.red,
        Colors.black,
        Colors.yellow,
      ],
      sizes: [
        'S',
        'M',
        'L',
        'XL',
      ],
      img: 'assets/images/product2.jpg',
      name: 'Product 1',
      price: '520',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Id aliquet lectus proin nibh. Ante metus dictum at tempor. Sed ullamcorper morbi tincidunt ornare massa.',
      isBestSeller: false,
      rating: '2.6'),
  ProductModel(
      listedColors: [
        Colors.green,
        Colors.grey,
        Colors.black
      ],
      sizes: [
        'S',
        'M',
        'L',
        'XL',
        'XXL',
      ],
      img: 'assets/images/product10.jpg',
      name: 'Product 10',
      price: '960',
      description:
          'Na here i go find watin to write oh bbut i no wan generate text lorumpsun abi watin them dey call that thing na pigin go sha dey here',
      isBestSeller: false,
      rating: '5.0'),
];
