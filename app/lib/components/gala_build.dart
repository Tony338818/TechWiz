// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MyGala extends StatelessWidget {
  final String img;
  final String title;
  MyGala({super.key,required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: Column(
          children: [
            Image.network(img),
            Text(title)
          ],
        ),
      ),
    );
  }
}
