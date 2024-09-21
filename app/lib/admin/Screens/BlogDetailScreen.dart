import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {
  static const routeName = '/blog-detail';
  
  final int postId;

  const BlogDetailScreen({Key? key})
    : postId = 0,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Post $args'),
      ),
      body: Center(
        child: Text('Detailed view of Blog Post $args'),
      ),
    );
  }
}