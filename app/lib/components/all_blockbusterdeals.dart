import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/homeproduct_class.dart';

class BlockbusterDeals extends StatelessWidget {
  final Product product;

  BlockbusterDeals({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Product Image with Discount Badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8), // Rounded corners for image
                child: Image.network(
                  product.imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              if (product.hasDiscount) // Display discount badge if hasDiscount is true
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '20% off',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 10),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  product.productName,
                  style: GoogleFonts.outfit(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // Avoid overflow for long names
                ),
                Text(
                  'By ${product.brand}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
                Row(
                  children: [
                    Text(
                      '₹${product.price}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (product.hasDiscount) // Show slashed price if discount is available
                      SizedBox(width: 8),
                    if (product.hasDiscount)
                      Text(
                        '₹${product.slashedPrice}',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      product.rating.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Favorite/Heart Icon
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
              onPressed: () {
                // Handle favorite action
              },
            ),
          ),
        ],
      ),
    );
  }
}
