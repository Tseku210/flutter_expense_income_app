import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BillItem extends StatelessWidget {
  final String image;
  final String title;
  final String day;
  const BillItem({
    super.key,
    required this.image,
    required this.title,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F6F5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(image: AssetImage(image))),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Text(day, style: const TextStyle(fontSize: 13))
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                backgroundColor: Colors.green[50],
                padding: const EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Pay",
                style: TextStyle(color: primaryColor, fontSize: 16),
              ),
            ),
          ]),
    );
  }
}
