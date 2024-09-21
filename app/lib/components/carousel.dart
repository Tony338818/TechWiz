// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_import, unused_local_variable, sized_box_for_whitespace, avoid_unnecessary_containers, unused_field

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  final List<String> imageList;
  Carousel({super.key, required this.imageList});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  late List<String> images = [];

  final List<String> categories = [
    'Bedroom',
    'Living Room',
    'Kitchen',
  ];

  @override
  void initState() {
    super.initState();
    images = widget.imageList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Carousel slider
      CarouselSlider(
        options: CarouselOptions(
          height: 250.0,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          viewportFraction: 0.8,
          enlargeCenterPage: true,
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        items: images
            .map((item) => Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Text(
                            categories[images.indexOf(item)],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black.withOpacity(0.5),
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    ]);
  }
}
