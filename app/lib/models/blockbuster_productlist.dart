import 'package:flutter/material.dart';
import '../Category/productdescription_screen.dart';
import '../components/all_blockbusterdeals.dart';
import 'homeproduct_class.dart';

class BlockbusterProductlist extends StatelessWidget {
  final List<Product> products = [
    Product(
      productName: "Sofa",
      imageUrl: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg',
      description: "A 3-seater sofa in blue color.",
      price: "₹46,499",
      slashedPrice: "₹58,000",
      rating: 4.0,
      galleryId: "livingroom",
      relatedProductIds: ["table", "lamp"],
      brand: 'Urban',
      hasDiscount: true,  // Set hasDiscount to true for this product
    ),
    Product(
      productName: "Pillow",
      imageUrl: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg',
      description: "A latex pillow with firm support.",
      price: "₹11,999",
      rating: 5.0,
      galleryId: "bedroom",
      relatedProductIds: ["bed", "duvet"],
      brand: 'Royalock',
      hasDiscount: false,  // No discount for this product
    ),
    Product(
      productName: "Football Bean Bag",
      imageUrl: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg',
      description: "A football-themed bean bag chair.",
      price: "₹2,499",
      slashedPrice: "₹4,000",
      rating: 2.3,
      galleryId: "sports",
      relatedProductIds: ["football", "gloves"],
      brand: 'Royal',
      hasDiscount: true,  // Set hasDiscount to true for this product
    ),
    Product(
      productName: "Chair",
      imageUrl: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg',
      description: "A 3-seater sofa in blue color.",
      price: "₹46,499",
      slashedPrice: "₹58,000",
      rating: 4.0,
      galleryId: "livingroom",
      relatedProductIds: ["table", "lamp"],
      brand: 'Urban',
      hasDiscount: true,  // Set hasDiscount to true for this product
    ),
    Product(
      productName: "Dining",
      imageUrl: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg',
      description: "A 3-seater sofa in blue color.",
      price: "₹46,499",
      slashedPrice: "₹58,000",
      rating: 4.0,
      galleryId: "livingroom",
      relatedProductIds: ["table", "lamp"],
      brand: 'Urban',
      hasDiscount: true,  // Set hasDiscount to true for this product
    ),
    Product(
      productName: "SmartLight",
      imageUrl: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg',
      description: "A 3-seater sofa in blue color.",
      price: "₹46,499",
      slashedPrice: "₹58,000",
      rating: 4.0,
      galleryId: "livingroom",
      relatedProductIds: ["table", "lamp"],
      brand: 'Urban',
      hasDiscount: true,  // Set hasDiscount to true for this product
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
            child: BlockbusterDeals(product: product),  // Use BlockbusterDeals class
          ),
        );
      }).toList(),
    );
  }
}