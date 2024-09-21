import 'package:app/models/trending_product.dart';
import 'package:flutter/material.dart';
import '../Category/productdescription_screen.dart';
import '../components/my_productcard.dart';
import 'homeproduct_class.dart';
class ProductList extends StatelessWidget {
  final List<Product> products = [
    Product(
        productName: "Bed",
        imageUrl: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg',
        description: "A king-sized bed with a wooden frame.",
        price: "₹5899",
        rating: 4.5,
        galleryId: "bedroom",
        relatedProductIds: ["chair", "lamp"],
        brand: 'Urbani'
    ),
    Product(
        productName: "Bed",
        imageUrl: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg',
        description: "A king-sized bed with a wooden frame.",
        price: "₹5899",
        rating: 4.5,
        galleryId: "bedroom",
        relatedProductIds: ["chair", "lamp"],
        brand: 'Craft'
    ),
    Product(
        productName: "Bed",
        imageUrl: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg',
        description: "A king-sized bed with a wooden frame.",
        price: "₹5899",
        rating: 4.5,
        galleryId: "bedroom",
        relatedProductIds: ["chair", "lamp"],
        brand: 'Qeak'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products.map((product) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(product: product),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ProductCard(product: product),
          ),
        );
      }).toList(),
    );
  }
}

