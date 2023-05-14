import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:green_ui/components/credit_card.dart';
import 'package:green_ui/components/custom_tab_bar.dart';
import 'package:green_ui/constants/constants.dart';

import '../components/top_bar.dart';

class ConnectWalletScreen extends StatefulWidget {
  const ConnectWalletScreen({super.key});

  @override
  State<ConnectWalletScreen> createState() => _ConnectWalletScreenState();
}

class _ConnectWalletScreenState extends State<ConnectWalletScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: size.height * 0.1,
      ),
      body: SizedBox(
        height: size.height,
        child: Stack(children: [
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
                  children: [
                    CustomTabBar2(
                      text1: "Cards",
                      text2: "Accounts",
                      widget1: Cards(),
                      widget2: Accounts(),
                      width: 400,
                      height: 500,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  InputDecoration buildCustomInputDecoration(
      String labelText, String hintText) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: lightPrimaryColor,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: lightPrimaryColor,
        ),
      ),
      labelStyle: const TextStyle(color: lightPrimaryColor),
      labelText: labelText,
      hintText: hintText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: Column(
        children: [
          CreditCard(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              isCvvFocused: isCvvFocused),
          CreditCardForm(
            formKey: formKey,
            obscureCvv: true,
            obscureNumber: true,
            isHolderNameVisible: true,
            isCardNumberVisible: true,
            isExpiryDateVisible: true,
            cardHolderName: cardHolderName,
            expiryDate: expiryDate,
            cardNumber: cardNumber,
            cvvCode: cvvCode,
            themeColor: lightPrimaryColor,
            cardNumberDecoration:
                buildCustomInputDecoration("XXXX XXXX XXXX XXXX", "Number"),
            expiryDateDecoration:
                buildCustomInputDecoration("XX/XX", "Expired Date"),
            cvvCodeDecoration: buildCustomInputDecoration("XXX", "CVV"),
            cardHolderDecoration: buildCustomInputDecoration("Name", "Name"),
            onCreditCardModelChange: onCreditCardModelChange,
          ),
        ],
      ),
    );
  }

  onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() => {
          cardNumber = creditCardModel!.cardNumber,
          expiryDate = creditCardModel.expiryDate,
          cardHolderName = creditCardModel.cardHolderName,
          cvvCode = creditCardModel.cvvCode,
          isCvvFocused = creditCardModel.isCvvFocused,
        });
  }
}

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  int selectedOption = 0;

  Widget customSelection({
    required int index,
    required String title,
    required String subtitle,
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
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: selectedOption == index ? lightPrimaryColor : grayTextColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              selectedOption = index;
            });
          },
          icon: Icon(
            Icons.check_circle,
            color: selectedOption == index
                ? lightPrimaryColor
                : Colors.transparent,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      width: 400,
      child: Column(
        children: [
          customSelection(
            icon: Icons.account_balance,
            title: "Bank Link",
            subtitle: "Connect your bank account to deposit & fund",
            index: 0,
          ),
          const SizedBox(height: 20),
          customSelection(
            icon: Icons.monetization_on,
            title: "Microdeposits",
            subtitle: "Connect bank in 5-7 days",
            index: 1,
          ),
          const SizedBox(height: 20),
          customSelection(
            icon: Icons.paypal,
            title: "Paypal",
            subtitle: "Connect your paypal account",
            index: 2,
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: 400,
            child: OutlinedButton(
              onPressed: () {},
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
                "Next",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
