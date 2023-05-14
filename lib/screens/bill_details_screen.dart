import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/top_bar.dart';
import '../constants/constants.dart';

class BillDetailsScreen extends StatefulWidget {
  const BillDetailsScreen({super.key});

  @override
  State<BillDetailsScreen> createState() => _BillDetailsScreenState();
}

class _BillDetailsScreenState extends State<BillDetailsScreen> {
  int selectedOption = 0;

  Widget customSelection({
    required int index,
    required String title,
    required IconData icon,
  }) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selectedOption == index
            ? primaryColor.withOpacity(0.1)
            : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () {
          setState(() {
            selectedOption = index;
          });
        },
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: selectedOption == index ? Colors.white : null,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 30,
            color: selectedOption == index ? lightPrimaryColor : grayTextColor,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: selectedOption == index ? lightPrimaryColor : grayTextColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Radio(
          value: index,
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value as int;
            });
          },
          activeColor: lightPrimaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Bill Details"),
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
      body: Column(children: [
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
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/youtube.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Youtube Premium',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Feb 28, 2022',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: 400,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Price',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: grayTextColor,
                                      ),
                                    ),
                                    Text(
                                      '\$ 11.99',
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
                                  children: const [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: grayTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '\$ 13.98',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
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
                                  'Select payment method',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                customSelection(
                                  index: 0,
                                  title: 'Debit Card',
                                  icon: Icons.credit_card,
                                ),
                                const SizedBox(height: 10),
                                customSelection(
                                  index: 1,
                                  title: 'Paypal',
                                  icon: Icons.paypal,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 400,
                            child: FilledButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/payment');
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
                                'Pay Now',
                                style: TextStyle(
                                  color: Colors.white,
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
            ))
      ]),
    );
  }
}
