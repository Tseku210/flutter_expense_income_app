import 'package:flutter/material.dart';
import 'package:green_ui/components/bill_item.dart';
import 'package:green_ui/components/top_bar.dart';
import 'package:green_ui/constants/constants.dart';

import '../components/transaction_item.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = '/wallet';

  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   title: const Text("Wallet"),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       tooltip: "Notification",
      //       icon: const Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: Icon(Icons.notifications_outlined, color: Colors.white),
      //       ),
      //     )
      //   ],
      // ),
      body: WalletContent(),
    );
  }
}

class WalletContent extends StatefulWidget {
  const WalletContent({super.key});

  @override
  State<WalletContent> createState() => _WalletContentState();
}

class _WalletContentState extends State<WalletContent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
          height: size.height * 0.9,
          child: Stack(
            children: [
              TopBar(size: size, isNotification: true, title: 'Wallet'),
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
                      // crossAxisAlignment: CrossAxisAlignment.,
                      children: [
                        const Text(
                          "Total Balance",
                          style: TextStyle(fontSize: 16, color: grayTextColor),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "\$2,548.00",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        const ThreeButtons(),
                        const SizedBox(height: 50),
                        // DefaultTabController(
                        //   length: 2,
                        //   child: Column(
                        //     children: const [
                        //       CustomTabBar(),
                        //       Expanded(
                        //         child: TabBarView(
                        //           children: [
                        //             Transactions(),
                        //             UpcomingBills(),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        CustomTabBar2(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ))
    ]);
  }
}

class ThreeButtons extends StatelessWidget {
  const ThreeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: lightPrimaryColor, width: 2)),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/connect_wallet');
                },
                icon: const Icon(
                  Icons.add,
                  color: lightPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text("Add"),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: lightPrimaryColor, width: 2)),
              child: const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.qr_code,
                  color: lightPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text("Pay"),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: lightPrimaryColor, width: 2)),
              child: const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.send,
                  color: lightPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text("Send"),
          ],
        ),
        // const CustomTabBar2()
      ]),
    );
  }
}

// class CustomTabBar extends StatelessWidget {
//   const CustomTabBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: TabBar(
//         indicator: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         labelColor: Colors.white,
//         dividerColor: Colors.black,
//         tabs: const [
//           Tab(
//             text: "Transactions",
//           ),
//           Tab(text: "Upcoming Bills")
//         ],
//       ),
//     );
//   }
// }

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          TransactionItem(
              image: "assets/images/up.png",
              title: "Upwork",
              day: "Today",
              income: true,
              amount: 850.00),
          TransactionItem(
              image: "assets/images/person.png",
              title: "Transfer",
              day: "Yesterday",
              income: false,
              amount: 85.00),
          TransactionItem(
              image: "assets/images/paypall.png",
              title: "Paypall",
              day: "Jan 30, 2022",
              income: true,
              amount: 1406.00),
          TransactionItem(
              image: "assets/images/youtube.png",
              title: "Youtube",
              day: "Jan 16, 2022",
              income: false,
              amount: 11.99),
          TransactionItem(
              image: "assets/images/youtube.png",
              title: "Youtube",
              day: "Jan 16, 2022",
              income: false,
              amount: 11.99),
        ],
      ),
    );
  }
}

class UpcomingBills extends StatelessWidget {
  const UpcomingBills({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          BillItem(
            image: "assets/images/up.png",
            title: "Upwork",
            day: "Today",
          ),
          BillItem(
            image: "assets/images/person.png",
            title: "Transfer",
            day: "Yesterday",
          ),
          BillItem(
            image: "assets/images/paypall.png",
            title: "Paypall",
            day: "Jan 30, 2022",
          ),
          BillItem(
            image: "assets/images/youtube.png",
            title: "Youtube",
            day: "Jan 16, 2022",
          ),
          BillItem(
            image: "assets/images/youtube.png",
            title: "Youtube",
            day: "Jan 16, 2022",
          ),
        ],
      ),
    );
    ;
  }
}

class CustomTabBar2 extends StatefulWidget {
  const CustomTabBar2({super.key});

  @override
  State<CustomTabBar2> createState() => _CustomTabBar2State();
}

class _CustomTabBar2State extends State<CustomTabBar2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      child: Column(
        children: [
          Container(
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.grey[200],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              labelColor: Colors.black,
              padding: const EdgeInsets.all(5),
              tabs: const [
                Tab(
                  text: "Transactions",
                ),
                Tab(text: "Upcoming Bills"),
              ],
            ),
          ),
          SizedBox(
            height: 280,
            width: 400,
            // color: Colors.white,
            child: TabBarView(
              controller: _tabController,
              children: const [
                Transactions(),
                UpcomingBills(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
