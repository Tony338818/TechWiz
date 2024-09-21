import 'package:flutter/material.dart';

class GalleryTable extends StatefulWidget {
  @override
  _GalleryTableState createState() => _GalleryTableState();
}

class _GalleryTableState extends State<GalleryTable> {
  List<Gallery> galleries = [
    Gallery(id: 1, name: 'Image 1', imageUrl: 'https://picsum.photos/250?image=1'),
    Gallery(id: 2, name: 'Image 2', imageUrl: 'https://picsum.photos/250?image=2'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: DataTable(
        columns: [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Image URL')), 
          DataColumn(label: Text('Actions')),
        ],
        rows: galleries.map((gallery) {
          return DataRow(cells: [
            DataCell(Text(gallery.id.toString())),
            DataCell(Text(gallery.name)),
            DataCell(Text(gallery.imageUrl)),
            DataCell(Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.blue, // Edit color
                  onPressed: () => _editUser(gallery),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red, // Delete color
                  onPressed: () => _deleteUser(gallery),
                ),
              ],
            )),
          ]);
        }).toList(),
      )),
    );
  }

  void _editUser(Gallery gallery) {
    Navigator.pushNamed(
      context,
      '/editGallery',
      arguments: gallery,
    );
  }

  void _deleteUser(Gallery gallery) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete ${gallery.name}? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  galleries.removeWhere((g) => g.id == gallery.id);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${gallery.name} has been deleted')),
                );
              },
            ),
          ],
        );
      },
    );
  }

}

class Gallery {
  final int id;
  final String name;
  final String imageUrl;

  Gallery({required this.id, required this.name, required this.imageUrl});
}

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: GalleryTable(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addGallery');
        },
        child: Icon(Icons.add),
        tooltip: 'Add to Gallery',
        backgroundColor: Color(0xFFFFDE82),
      ),
    );
  }
}



