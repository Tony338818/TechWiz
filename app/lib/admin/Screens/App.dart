import 'package:flutter/material.dart';

import 'GalleryScreen.dart';
import 'Home.dart';
import 'Users.dart';
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Home()),
    Center(child: GalleryScreen()),
    Center(child: UsersScreen())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: const Color(0xFF1e8449),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.6),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.photo_library),
                label: 'Gallery',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Users',
              ),
            ],
          ),
        ),
      ),
    );
  }
}