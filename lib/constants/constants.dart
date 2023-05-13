import 'package:flutter/material.dart';

import '../screens/graph_screen.dart';
import '../screens/home.dart';
import '../screens/profile_screen.dart';
import '../screens/wallet_screen.dart';

const primaryColor = Color(0xFF1B5C58);
const lightPrimaryColor = Color(0xFF2F7E79);
const linearTopLeft = Color(0xFF429690);
const linearBottomRight = Color(0xFF2A7C76);
const backgroundColor = Color(0xFFFFFFFF);
const grayTextColor = Color(0xFF666666);
const greenTextColor = Color(0xFF25A969);
const redTextColor = Color(0xFFF95B51);

const List<Widget> Screens = [
  HomeContent(),
  GraphScreen(),
  WalletScreen(),
  ProfileScreen(),
];

const List<String> ScreensURL = [
  HomeScreen.routeName,
  GraphScreen.routeName,
  WalletScreen.routeName,
  ProfileScreen.routeName,
];
