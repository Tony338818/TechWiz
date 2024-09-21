// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  // Static data for the wishlist items
  List<Map<String, dynamic>> wishlistItems = [
    {
      'name': 'Wishlist Product 1',
      'price': 180,
      'color': 'Red',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Wishlist Product 2',
      'price': 220,
      'color': 'Blue',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Wishlist Product 3',
      'price': 150,
      'color': 'Green',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Wishlist Product 4',
      'price': 90,
      'color': 'Yellow',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Wishlist Product 5',
      'price': 120,
      'color': 'Black',
      'image': 'https://via.placeholder.com/50'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: wishlistItems.isEmpty
          ? Center(
              child: Text('Your wishlist is empty!',
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
            )
          : ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                var item = wishlistItems[index];
                return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            item['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['name'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text('${item['price']} dollars',
                                  style: TextStyle(color: Colors.grey)),
                              Text('Color: ${item['color']}',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              wishlistItems.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
