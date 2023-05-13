import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double radius;
  final Color color;

  const Circle({super.key, required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: null,
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
            width: 10,
          ),
        ));
  }
}
