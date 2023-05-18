import 'package:flutter/material.dart';
import 'package:green_ui/constants/constants.dart';
import 'package:green_ui/providers/transaction_provider.dart';
import 'package:green_ui/screens/add_expense_screen.dart';
import 'package:green_ui/screens/bill_details_screen.dart';
import 'package:green_ui/screens/connect_wallet_screen.dart';
import 'package:green_ui/screens/graph_screen.dart';
import 'package:green_ui/screens/home.dart';
import 'package:green_ui/screens/payment_screen.dart';
import 'package:green_ui/screens/payment_success_screen.dart';
import 'package:green_ui/screens/profile_screen.dart';
import 'package:green_ui/screens/splash_screen.dart';
import 'package:green_ui/screens/wallet_screen.dart';
import 'package:provider/provider.dart';

import 'components/custom_navigation_bar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: const MyApp(),
    ),
  );
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
        '/home': (context) => const StartScreen(),
        '/connect_wallet': (context) => const ConnectWalletScreen(),
        '/expense': (context) => const AddExpenseScreen(),
        '/bill_details': (context) => const BillDetailsScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/payment_success': (context) => const PaymentSuccessScreen(),
        // энэ доошоо хэрэглэгдэхгүй байгаа
        '/graph': (context) => const HomeScreen(),
        '/wallet': (context) => const WalletScreen(),
        '/profile': (context) => const HomeScreen(),
      },
    );
  }
}

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentIndex],
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/expense");
              },
              backgroundColor: lightPrimaryColor,
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
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
