// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

List<Category> categories = [
  Category('Hoodies', 'images/hoodies.png'),
  Category('Shorts', 'images/shorts.png'),
  Category('Shoes', 'images/shoes.png'),
  Category('Bag', 'images/bag.png'),
  Category('Accessories', 'images/accessories.png'),
];

List<Product> productDetails = [
  Product('Men\'s Harrington Jacket', 'images/Rectangle 8.png', 148.00),
  Product('Max Cirro Men\'s Slides', 'images/Rectangle 93.png', 55.00, 100.97),
  Product('Men\'s Coaches Jacket', 'images/Rectangle 94.png', 66.97),
];

class Category {
  final String categoryName;
  final String categoryImage;

  Category(this.categoryName, this.categoryImage);
}

class Product {
  final String productName;
  final String imageFile;
  final double currentPrice;
  final double? formerPrice;

  Product(this.productName, this.imageFile, this.currentPrice,
      [this.formerPrice]);
}

final ValueNotifier<Map<Product, int>> cartNotifier = ValueNotifier({});

