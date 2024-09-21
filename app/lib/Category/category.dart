// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../components/my_drawer.dart';


class CategoryScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(name: 'Furniture', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
    Category(name: 'Furnishing', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    Category(name: 'Mattresses', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
    Category(name: 'Sofas & Seating', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    Category(name: 'Home Decor', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
    Category(name: 'Kitchen', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    Category(name: 'Lighting', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
    Category(name: 'Bathrooms', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    Category(name: 'Offices', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
    Category(name: 'Garage', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    Category(name: 'Spa', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
    Category(name: 'Dinning', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Categories'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubCategoryScreen(
                    category: categories[index].name,
                  ),
                ),
              );
            },
            child: CategoryCard(category: categories[index]),
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        // color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(category.image, height: 80,fit: BoxFit.cover,),
          SizedBox(height: 10),
          Text(category.name, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class SubCategoryScreen extends StatelessWidget {
  final String category;

  SubCategoryScreen({required this.category});

  final Map<String, List<SubCategory>> subCategories = {
    'Sofas & Seating': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
    'Furniture': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
    'Furnishing': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
    'Mattresses': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
    'Home Decor': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
    'Kitchen': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
    'Lighting': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
    'Bathrooms': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
    'Dinning': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
    'Offices': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
    'Garage': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
    'Spa': [
      SubCategory(name: 'Sofa sets', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Futons', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Recliners', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Chaise lounges', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
      SubCategory(name: 'Bean bags', image: 'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg'),
      SubCategory(name: 'Sofa chairs', image: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: subCategories[category]?.length ?? 0,
        itemBuilder: (context, index) {
          final subCategory = subCategories[category]![index];
          return GestureDetector(
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ,
              //     ),
              //   );
              // },
              child: CategoryCard(category: subCategory)
          );
        },
      ),
    );
  }
}

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}

class SubCategory extends Category {
  SubCategory({required String name, required String image})
      : super(name: name, image: image);
}
