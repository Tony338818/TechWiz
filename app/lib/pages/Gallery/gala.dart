// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:convert';

import 'package:app/components/gala_build.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/gallery_model.dart';

class Gala extends StatefulWidget {
  const Gala({super.key});

  @override
  State<Gala> createState() => _GalaState();
}

class _GalaState extends State<Gala> {
  List<GalleryModel> items = [];

  @override
  void initState() {
    super.initState();
    // upload();
  }

  Future<void> upload() async {
    final String response = await rootBundle.loadString('assets/galas.json');
    final List<dynamic> data = json.decode(response);

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    for (var item in data) {
      await firestore.collection('test').add(item);
    }
  }

  Future<List<Map<String, dynamic>>> fetchgala() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('test').get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gala'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchgala(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No gala Available'));
          }

          final Gala = snapshot.data!;

          return ListView.builder(
            itemCount: Gala.length, // Access length here
            itemBuilder: (context, index) {
              var gala = Gala[index];
              var image = gala['images'];
              String firstImage = '';
              if (image is List && image.isNotEmpty) {
                firstImage = image[0]; // Get the first author
              } else {
                firstImage = image.toString(); // Fallback if it's not a list
              }
              return MyGala(img: firstImage, title: gala['title']);
            },
          );
        },
      ),
    );
  }
}
