import 'package:flutter/material.dart';
import 'package:green_ui/screens/home.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // Define your navigation items and icons
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      // Define the currently selected index
      currentIndex: 0,
      // Add an onTap callback to handle navigation
      onTap: (index) {
        // Handle navigation logic here
      },
    );
  }
}
