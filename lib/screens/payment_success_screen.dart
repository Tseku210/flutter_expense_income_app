import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../components/top_bar.dart';
import '../constants/constants.dart';
import '../entities/transaction.dart';
import '../providers/transaction_provider.dart';
import 'package:intl/intl.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var transactionProvider = Provider.of<TransactionProvider>(context);
    Transaction transaction = transactionProvider.selectedBillItem;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Bill Payment"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: "More",
            icon: const Icon(Icons.more_horiz),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                TopBar(size: size),
                Positioned(
                  top: size.height * 0.20,
                  child: Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 400,
                            child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.check_circle,
                                    color: primaryColor, size: 40)),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            child: Column(
                              children: [
                                const Text(
                                  'Payment Successful',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: lightPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  transaction.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: grayTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Transaction Details',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Payment method',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: grayTextColor,
                                      ),
                                    ),
                                    Text(
                                      'Debit Card',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: grayTextColor,
                                      ),
                                    ),
                                    Text(
                                      'Completed',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: lightPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Time',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: grayTextColor,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('hh:mm a')
                                          .format(DateTime.now())
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Date',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: grayTextColor,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('MMM d, yyyy')
                                          .format(DateTime.now())
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Transaction ID',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: grayTextColor,
                                      ),
                                    ),
                                    Text(
                                      '1234567890',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Divider(
                                  color: Colors.grey.withOpacity(0.5),
                                  thickness: 1,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Price',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: grayTextColor,
                                      ),
                                    ),
                                    Text(
                                      '\$${transaction.amount.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Fee',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: grayTextColor,
                                      ),
                                    ),
                                    Text(
                                      '\$ 1.99',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: lightPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Divider(
                                  color: Colors.grey.withOpacity(0.5),
                                  thickness: 1,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: grayTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '\$${(transaction.amount + 1.99).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            width: 400,
                            child: OutlinedButton(
                              onPressed: () {
                                // transactionProvider.clearBill();
                                Navigator.pushNamed(context, '/home');
                              },
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                side: const BorderSide(
                                  color: lightPrimaryColor,
                                ),
                              ),
                              child: const Text(
                                'Share Receipt',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
