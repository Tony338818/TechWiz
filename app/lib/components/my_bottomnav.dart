import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Color(0xFF428AC4), // Background color of the nav bar
        borderRadius: BorderRadius.circular(30.0), // Rounded edges
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildNavItem(
            context,
            icon: Icons.home,
            label: 'Home',
            index: 0,
            isSelected: selectedIndex == 0,
          ),
          _buildNavItem(
            context,
            icon: Icons.category,
            label: 'Category',
            index: 1,
            isSelected: selectedIndex == 1,
          ),
          _buildNavItem(
            context,
            icon: Icons.photo_library,
            label: 'Gallery',
            index: 2,
            isSelected: selectedIndex == 2,
          ),
          _buildNavItem(
            context,
            icon: Icons.shopping_cart,
            label: 'Cart',
            index: 3,
            isSelected: selectedIndex == 3,
          ),
          _buildNavItem(
            context,
            icon: Icons.person,
            label: 'Profile',
            index: 4,
            isSelected: selectedIndex == 4,
          ),
        ],
      ),
    );
  }

  // Function to build each navigation item
  Widget _buildNavItem(BuildContext context,
      {required IconData icon, required String label, required int index, required bool isSelected}) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ?  Color(0xFF07243B) : Colors.transparent, // Highlight when selected
          borderRadius: BorderRadius.circular(20.0), // Rounded edges for each icon
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Color(0xFF41D7EA) : Colors.black87,
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: TextStyle(
                    color: Color(0xFF41D7EA),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
