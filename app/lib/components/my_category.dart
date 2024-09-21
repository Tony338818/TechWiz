import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Category/category.dart';

class CategoryList extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      'name': 'Sofas & Seating',
      'image': 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'
    },
    {
      'name': 'Furniture',
      'image': 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'
    },
    {
      'name': 'Furnishing',
      'image': 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'
    },
    {
      'name': 'Table',
      'image': 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'
    },
    {
      'name': 'Chair',
      'image': 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'
    },
    {
      'name': 'Mattresses',
      'image': 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Makes the list scroll horizontally
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: categories.map((category) {
            return GestureDetector(
              onTap: () {
                // Navigate to SubCategoryScreen and pass the category name
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubCategoryScreen(category: category['name']!),
                  ),
                );
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(
                        category['image']!,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    category['name']!,
                    style: GoogleFonts.outfit(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
