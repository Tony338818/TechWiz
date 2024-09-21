// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, unused_element, avoid_print

import 'package:app/pages/Gallery/gala.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/gallery_carousel.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String _selectedFilter = '';
  void showSortingOptions(BuildContext context, String filterType) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        List<String> sortingOptions = [];
        switch (filterType) {
          case 'room':
            sortingOptions = ['Living Room', 'Bedroom', 'Kitchen'];
            break;
          case 'theme':
            sortingOptions = ['Modern', 'Classic', 'Rustic'];
            break;
          case 'color':
            sortingOptions = ['Red', 'Blue', 'Green'];
            break;
          case 'rating':
            sortingOptions = ['5 Stars', '4 Stars', '3 Stars'];
            break;
        }

        return Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Sorting Options for $filterType',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: sortingOptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(sortingOptions[index]),
                    onTap: () {
                      setState(() {
                        _selectedFilter = sortingOptions[index];
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Row(
          children: [
            Expanded(child: CupertinoSearchTextField()),
            PopupMenuButton<String>(
              icon: Icon(Icons.filter_list_outlined),
              onSelected: (String value) {
                showSortingOptions(context, value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'room',
                    child: Text('Filter by room type'),
                  ),
                  PopupMenuItem<String>(
                    value: 'theme',
                    child: Text('Filter by theme/style'),
                  ),
                  PopupMenuItem<String>(
                    value: 'color',
                    child: Text('Filter by color'),
                  ),
                  PopupMenuItem<String>(
                    value: 'rating',
                    child: Text('Filter by Rating'),
                  ),
                ];
              },
            )
          ],
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              GalleryCarousel(),
              SizedBox(
                height: 20,
              ),
              Gala(selectedFilter: _selectedFilter),
            ],
          ),
        )),
      ),
    );
  }
}
