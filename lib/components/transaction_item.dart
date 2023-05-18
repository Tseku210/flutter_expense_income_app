import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TransactionItem extends StatelessWidget {
  final String image;
  final String title;
  final String day;
  final bool income;
  final double amount;
  const TransactionItem({
    super.key,
    required this.image,
    required this.title,
    required this.day,
    required this.income,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
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
            Text(
                income
                    ? '+ \$ ${amount.toStringAsFixed(2)}'
                    : '- \$ ${amount.toStringAsFixed(2)}',
                style: TextStyle(
                    color: income ? greenTextColor : redTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700))
          ]),
    );
  }
}
