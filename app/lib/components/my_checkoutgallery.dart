import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutOurGallery extends StatelessWidget {
  final Function(int) onCollectionTap; // Add callback for tapping a collection

  CheckoutOurGallery({required this.onCollectionTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Checkout Our Gallery',
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onCollectionTap(2); // Navigate to the GalleryPage when tapped
                  },
                  child: _buildGalleryCard(context, index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryCard(BuildContext context, int index) {
    List<String> collectionTitles = [
      'The Cosmos Collection',
      'The Clarkson Collection'
    ];
    List<String> imageUrls = [
      'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg',
      'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Image.network(imageUrls[index], fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  collectionTitles[index],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
