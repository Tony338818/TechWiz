import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Category/productdescription_screen.dart';
import '../models/homeproduct_class.dart';

class Blockbuster extends StatelessWidget {
  final List<Product> products;

  // Pass the products from BlockbusterProductlist
  Blockbuster({required this.products});

  @override
  Widget build(BuildContext context) {
    // Check if the product list is empty
    if (products.isEmpty) {
      return Center(child: Text('No products available')); // Display message if empty
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        child: Row(
          children: List.generate(
            // Ensure the list is at most 4 items
            products.length < 4 ? products.length : 4,
                (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0), // Add spacing between items
                child: _buildProductCard(context, products[index]), // Fetch product dynamically
              );
            },
          ),
        ),
      ),
    );
  }

  // Updated _buildProductCard to accept product as a parameter
  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        height: 250,
        width: 170, // Set a fixed width for the card
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    child: Image.network(
                      product.imageUrl, // Fetch product image dynamically
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              // Product details section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName, // Fetch product name dynamically
                      style: GoogleFonts.outfit(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      product.brand, // Fetch brand dynamically
                      style: GoogleFonts.outfit(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Row with price and favorite icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Prices section
                        Row(
                          children: [
                            Text(
                              product.price, // Fetch product price dynamically
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4),
                            if (product.hasDiscount)
                              Text(
                                product.slashedPrice ?? '', // Show slashed price only if discount exists
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                          ],
                        ),
                        // Favorite Icon
                        IconButton(
                          icon: Icon(Icons.favorite_border,),
                          onPressed: () {
                            // Implement saving functionality
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
