import 'package:flutter/material.dart';
import 'package:green_ui/entities/transaction.dart';
import 'package:green_ui/screens/connect_wallet_screen.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/transaction_provider.dart';
import '../screens/payment_screen.dart';

class BillItem extends StatefulWidget {
  final Transaction transaction;

  const BillItem({
    super.key,
    required this.transaction,
  });

  @override
  State<BillItem> createState() => _BillItemState();
}

class _BillItemState extends State<BillItem> {
  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
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
                    child: Image(image: AssetImage(widget.transaction.image))),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.transaction.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Text(
                        '${widget.transaction.date.day}/${widget.transaction.date.month}/${widget.transaction.date.year}',
                        style: const TextStyle(fontSize: 13))
                  ],
                ),
              ],
            ),
            FilledButton(
              onPressed: () {
                transactionProvider.selectBill(widget.transaction.id);
                Navigator.pushNamed(context, '/connect_wallet');
              },
              style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: lightPrimaryColor.withOpacity(0.1)),
              child: const Text(
                "Pay",
                style: TextStyle(color: primaryColor, fontSize: 16),
              ),
            ),
          ]),
    );
  }
}
