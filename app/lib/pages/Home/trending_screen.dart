import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/trending_product.dart';
class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          'Trending Products',
          style: GoogleFonts.outfit(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color:  Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TrendingProduct(),
        ),
      ),
    );
  }
}
