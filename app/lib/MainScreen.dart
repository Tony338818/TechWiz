import 'package:app/components/Profile/profile.dart';
import 'package:app/pages/Gallery/gallery_screen.dart';
import 'package:flutter/material.dart';
import '../Components/my_bottomnav.dart';
import 'Category/category.dart';
import 'pages/Cart/cart_screen.dart';
import 'pages/Home/home_screen.dart'; // Import the custom nav bar

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Default to HomeScreen

  // Function to update the selected tab from outside the bottom nav
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateToGallery() {
    setState(() {
      _selectedIndex = 2; // Set index for GalleryPage
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _getSelectedScreen(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  // Define the pages for each bottom navigation item
  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return HomePage(navigateToGallery: navigateToGallery); // Pass the navigation function
      case 1:
        return CategoryScreen();
      case 2:
        return GalleryScreen(); // Switches to GalleryPage
      case 3:
        return CartScreen();
      default:
        return ProfilePage(email: 'email.com',);
    }
  }
}
