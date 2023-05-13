import 'package:flutter/material.dart';
import 'package:green_ui/constants/constants.dart';
import 'package:green_ui/screens/add_expense_screen.dart';
import 'package:green_ui/screens/graph_screen.dart';
import 'package:green_ui/screens/home.dart';
import 'package:green_ui/screens/profile_screen.dart';
import 'package:green_ui/screens/splash_screen.dart';
import 'package:green_ui/screens/wallet_screen.dart';

void main() {
  runApp(const MyApp());
}

class CustomColors {
  static const int _primaryColorValue = 0xFF2F7E79;

  static const MaterialColor primaryColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_primaryColorValue),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: CustomColors.primaryColor,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const HomeScreen(),
          '/graph': (context) => const HomeScreen(),
          '/expense': (context) => const AddExpenseScreen(),
          '/wallet': (context) => const WalletScreen(),
          '/profile': (context) => const HomeScreen(),
        });
  }
}

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    GraphScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: lightPrimaryColor,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? const Icon(Icons.home_filled)
                : const Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? const Icon(Icons.bar_chart)
                : const Icon(Icons.bar_chart_outlined),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? const Icon(Icons.wallet)
                : const Icon(Icons.wallet_outlined),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 3
                ? const Icon(Icons.abc)
                : const Icon(Icons.abc_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
