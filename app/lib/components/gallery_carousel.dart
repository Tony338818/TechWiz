import 'package:app/components/carousel.dart';
import 'package:flutter/material.dart';

class GalleryCarousel extends StatelessWidget {
  const GalleryCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'https://plus.unsplash.com/premium_photo-1675963768647-78e4178fc504?q=80&w=1991&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      "https://images.unsplash.com/photo-1613685301586-4f2b15f0ccd4?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=1916&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ];
    return Carousel(imageList: images,);
  }
}