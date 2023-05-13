import 'package:flutter/material.dart';
import 'package:green_ui/components/circle.dart';
import 'package:green_ui/components/custom_navigation_bar.dart';
import 'package:green_ui/components/top_bar.dart';
import 'package:green_ui/components/transaction_item.dart';
import 'package:green_ui/constants/constants.dart';
import 'package:green_ui/screens/profile_screen.dart';
import 'package:green_ui/screens/wallet_screen.dart';

import 'graph_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.45,
            child: Stack(
              children: <Widget>[
                // top bar
                TopBar(
                  size: size,
                  name: "Tseku",
                  isHomeScreen: true,
                  isNotification: true,
                ),
                // card
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 200,
                        decoration: BoxDecoration(
                          color: lightPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 15,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: const <Widget>[
                                      Text(
                                        'Total Balance',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.keyboard_arrow_up_outlined,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.more_horiz,
                                    color: Colors.white,
                                    size: 21,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '\$5,000.00',
                                // textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.15),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                  Icons.arrow_downward,
                                                  color: Colors.white,
                                                  size: 16),
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              'Income',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          '\$2,000.00',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.15),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                  Icons.arrow_upward,
                                                  color: Colors.white,
                                                  size: 16),
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              'Expenses',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          '\$1,000.00',
                                          // textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Transaction History",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          Text("See all",
                              style: TextStyle(
                                color: grayTextColor,
                                fontSize: 14,
                              ))
                        ]),
                    const TransactionItem(
                        image: "assets/images/up.png",
                        title: "Upwork",
                        day: "Today",
                        income: true,
                        amount: 850.00),
                    const TransactionItem(
                        image: "assets/images/person.png",
                        title: "Transfer",
                        day: "Yesterday",
                        income: false,
                        amount: 85.00),
                    const TransactionItem(
                        image: "assets/images/paypall.png",
                        title: "Paypall",
                        day: "Jan 30, 2022",
                        income: true,
                        amount: 1406.00),
                    const TransactionItem(
                        image: "assets/images/youtube.png",
                        title: "Youtube",
                        day: "Jan 16, 2022",
                        income: false,
                        amount: 11.99),
                    const TransactionItem(
                        image: "assets/images/youtube.png",
                        title: "Youtube",
                        day: "Jan 16, 2022",
                        income: false,
                        amount: 11.99),
                  ]),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text("Send Again",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              Text("See all",
                                  style: TextStyle(
                                    color: grayTextColor,
                                    fontSize: 14,
                                  ))
                            ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/woman1.png"),
                                  radius: 30),
                              CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/man1.png"),
                                  radius: 30),
                              CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/woman2.png"),
                                  radius: 30),
                              CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/man2.png"),
                                  radius: 30),
                              CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/woman3.png"),
                                  radius: 30),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            )),
          )
        ],
      ),
    );
  }
}
