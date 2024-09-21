// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_element, unused_label

import 'package:app/components/carousel1.dart';
import 'package:flutter/material.dart';

class GalleryDescriptionScreen extends StatefulWidget {
  Map<String, dynamic> DataList;
  GalleryDescriptionScreen({super.key, required this.DataList});

  @override
  State<GalleryDescriptionScreen> createState() =>
      _GalleryDescriptionScreenState();
}

class _GalleryDescriptionScreenState extends State<GalleryDescriptionScreen> {
  int _selectedIndex = 0;

  final List<Widget> widgetList = [
    About(
      DataList: {},
    ),
    Review(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    About(DataList: widget.DataList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Text('Product Details'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, size: 30, color: Colors.red)),
              IconButton(
                  onPressed: () {},
                  icon:
                      Icon(Icons.shopping_bag, size: 30, color: Colors.white)),
            ],
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                CarouselOne(
                  imageList: (widget.DataList['images'] as List<dynamic>)
                      .map((item) => item.toString())
                      .toList(),
                  onPressed: () {},
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      child: Text('About'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: Text('Review'),
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),
                SizedBox(height: 20),
                widgetList[_selectedIndex],
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {},
              child: Text('WishList'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  Map<String, dynamic> DataList;
  About({super.key, required this.DataList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Beautiful Living Room',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 5.0),
        Text(
          'Theme is fine too',
          style: TextStyle(color: Colors.deepOrange, fontSize: 20),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 5.0),
        Text(
          'Price',
          style: TextStyle(color: Colors.deepOrange, fontSize: 20),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 5.0),
        SizedBox(height: 400, child: imgBuilder(DataList)),
      ],
    );
  }
}

Widget Review() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Reviews',
        style: TextStyle(fontSize: 20),
      ),
    ],
  );
}


Widget imgBuilder(Map<String, dynamic> DataList) {
  void fullDisplay(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
                SizedBox(height: 20),
                Image.network(imageUrl),
              ],
            ),
          ),
        );
      },
    );
  }

  List<String> imageList = (DataList['images'] as List<dynamic>)
      .map((item) => item.toString())
      .toList();

  return Container(
    height: 200,
    child: GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: imageList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        String imageUrl = imageList[index];

        return GestureDetector(
          onTap: () => fullDisplay(context, imageUrl),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.broken_image);
              },
            ),
          ),
        );
      },
    ),
  );
}
