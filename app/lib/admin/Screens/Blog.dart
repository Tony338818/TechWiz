import 'package:flutter/material.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return BlogPreviewCard(
            imageUrl: 'https://picsum.photos/200/300?random=$index',
            previewText: 'This is a preview of blog post ${index + 1}...',
            lastEdited: DateTime.now().subtract(Duration(days: index)),
            onTap: () {
              // Navigate to detailed view
              Navigator.pushNamed(
                context,
                '/blogDetail',
                arguments: index,
              );
            },
          );
        },
      ),
    );
  }
}

class BlogPreviewCard extends StatelessWidget {
  final String imageUrl;
  final String previewText;
  final DateTime lastEdited;
  final VoidCallback onTap;

  const BlogPreviewCard({
    required this.imageUrl,
    required this.previewText,
    required this.lastEdited,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    previewText,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Last edited: ${lastEdited.toString().split(' ')[0]}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

