import 'package:flutter/material.dart';

import '../../models/homeproduct_class.dart';
class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            const SizedBox(height: 16),
            Text(
              product.productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Price: ${product.price}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            if (product.hasDiscount)
              Text(
                'Slashed Price: ${product.slashedPrice}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              'Rating: ${product.rating}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Brand: ${product.brand}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}