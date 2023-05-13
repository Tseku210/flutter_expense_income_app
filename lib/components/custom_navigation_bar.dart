import 'package:flutter/material.dart';
import 'package:green_ui/constants/constants.dart';

import '../screens/graph_screen.dart';
import '../screens/home.dart';
import '../screens/profile_screen.dart';
import '../screens/wallet_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  void onTap(int index) {
    // widget.onTap(index);
    setState(() {
      currentIndex = index;
    });
    Navigator.pushNamed(context, ScreensURL[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home_filled, size: 30),
            color: widget.currentIndex == 0 ? lightPrimaryColor : Colors.grey,
            onPressed: () => onTap(0),
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart, size: 30),
            color: widget.currentIndex == 1 ? lightPrimaryColor : Colors.grey,
            onPressed: () => onTap(1),
          ),
          IconButton(
            icon: const Icon(Icons.wallet, size: 30),
            color: widget.currentIndex == 2 ? lightPrimaryColor : Colors.grey,
            onPressed: () => onTap(2),
          ),
          IconButton(
            icon: const Icon(Icons.person, size: 30),
            color: widget.currentIndex == 3 ? lightPrimaryColor : Colors.grey,
            onPressed: () => onTap(3),
          ),
        ],
      ),
    );
  }
}
