import 'package:flutter/material.dart';
import 'package:green_ui/constants/constants.dart';
import 'package:green_ui/screens/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

    return Scaffold(
      backgroundColor: lightPrimaryColor,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            lightPrimaryColor,
            primaryColor,
          ],
        )),
        child: const Center(
          child: Text("mono",
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
