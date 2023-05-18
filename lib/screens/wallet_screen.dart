import 'package:flutter/material.dart';
import 'package:green_ui/components/bill_item.dart';
import 'package:green_ui/components/top_bar.dart';
import 'package:green_ui/constants/constants.dart';
import 'package:green_ui/screens/connect_wallet_screen.dart';
import 'package:provider/provider.dart';

import '../components/custom_tab_bar.dart';
import '../components/transaction_item.dart';
import '../entities/transaction.dart';
import '../providers/transaction_provider.dart';

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
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    transactionProvider.fetchTransactions();

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
                        Text(
                          "\$${transactionProvider.balance.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        const ThreeButtons(),
                        const SizedBox(height: 50),
                        CustomTabBar2(
                          text1: "Transactions",
                          text2: "Upcoming Bills",
                          widget1: Transactions(
                              transactionProvider: transactionProvider),
                          widget2: UpcomingBills(
                            transactionProvider: transactionProvider,
                          ),
                          height: 280,
                          width: 400,
                        ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConnectWalletScreen()));
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

class Transactions extends StatelessWidget {
  TransactionProvider transactionProvider;
  Transactions({super.key, required this.transactionProvider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      physics: const ScrollPhysics(),
      itemCount: transactionProvider.transactions.length,
      itemBuilder: (context, index) {
        Transaction transaction = transactionProvider.transactions[index];
        return TransactionItem(
          image: transaction.image,
          title: transaction.title,
          day:
              '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
          income: transaction.income,
          amount: transaction.amount,
        );
      },
    );
  }
}

class UpcomingBills extends StatelessWidget {
  TransactionProvider transactionProvider;
  UpcomingBills({super.key, required this.transactionProvider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: transactionProvider.bills.length,
      itemBuilder: (context, index) {
        Transaction transaction = transactionProvider.bills[index];
        return BillItem(
          image: transaction.image,
          title: transaction.title,
          day:
              '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
          income: transaction.income,
          amount: transaction.amount,
        );
      },
    );
  }
}
