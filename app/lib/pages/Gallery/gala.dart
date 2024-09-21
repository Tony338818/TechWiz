// // ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print

// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:app/services/gala_services.dart';
import '../../components/gala_build.dart';

class Gala extends StatefulWidget {
  final String selectedFilter;

  const Gala({super.key, required this.selectedFilter});

  @override
  State<Gala> createState() => _GalaState();
}

class _GalaState extends State<Gala> {
  static List<Map<String, dynamic>> DataList = [];
  List<Map<String, dynamic>> filteredDataList = [];
  GalleryServices Gs = GalleryServices();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<Map<String, dynamic>> fetchedData = await Gs.fetchGallery();

      setState(() {
        DataList = fetchedData;
        filteredDataList =
            fetchedData; 
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void applyFilter() {
    setState(() {
      if (widget.selectedFilter.isNotEmpty) {
        filteredDataList = DataList.where((item) {
          final roomType = item['roomType'] as String?;
          final theme = item['theme'] as String?;
          final color = item['color'] as String?;
          final rating = item['rating'] as String?;

          return (roomType == widget.selectedFilter ||
              theme == widget.selectedFilter ||
              color == widget.selectedFilter ||
              rating == widget.selectedFilter);
        }).toList();
      } else {
        filteredDataList = DataList;
      }
    });
  }

  @override
  void didUpdateWidget(covariant Gala oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedFilter != widget.selectedFilter) {
      applyFilter();
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              GridView.builder(
                itemCount: filteredDataList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  var gala = filteredDataList[index];
                  var image = gala['images'];
                  String firstImage = '';

                  if (image is List && image.isNotEmpty) {
                    firstImage = image[0];
                  } else {
                    firstImage = image.toString();
                  }

                  return MyGala(DataList: gala,);
                },
              )
            ],
          );
  }
}
