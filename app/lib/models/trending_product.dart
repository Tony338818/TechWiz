import 'package:flutter/material.dart';
import '../Category/productdescription_screen.dart';
import '../components/my_productcard.dart';
import 'homeproduct_class.dart';

class TrendingProduct extends StatelessWidget {
  TrendingProduct({super.key});

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
      hasDiscount: true,
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
      hasDiscount: false,
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
      hasDiscount: false,
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
      hasDiscount: false,
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
      hasDiscount: false,
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
      hasDiscount: true,
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


