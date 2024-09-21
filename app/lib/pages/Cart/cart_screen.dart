// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: CartBuilder(),
    );
  }
}

class CartBuilder extends StatefulWidget {
  const CartBuilder({super.key});

  @override
  State<CartBuilder> createState() => _CartBuilderState();
}

class _CartBuilderState extends State<CartBuilder> {
  // Static data for the cart items
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Product 1',
      'price': 200,
      'quantity': 2,
      'color': 'Red',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Product 2',
      'price': 150,
      'quantity': 1,
      'color': 'Blue',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Product 3',
      'price': 300,
      'quantity': 3,
      'color': 'Green',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Product 4',
      'price': 100,
      'quantity': 1,
      'color': 'Yellow',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Product 5',
      'price': 250,
      'quantity': 1,
      'color': 'Black',
      'image': 'https://via.placeholder.com/50'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      shrinkWrap: true,
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        var item = cartItems[index];

        return Card(
          elevation: 2.0,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('${item['price']} dollars',
                            style: TextStyle(color: Colors.grey)),
                        Text('Color: ${item['color']}',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (item['quantity'] > 1) item['quantity']--;
                            });
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text('${item['quantity']}'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              item['quantity']++;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          cartItems.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
