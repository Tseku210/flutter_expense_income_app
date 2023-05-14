import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:green_ui/constants/constants.dart';

class CreditCard extends StatefulWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;
  const CreditCard(
      {super.key,
      required this.cardNumber,
      required this.expiryDate,
      required this.cardHolderName,
      required this.cvvCode,
      required this.isCvvFocused});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: widget.cardNumber,
      expiryDate: widget.expiryDate,
      cardHolderName: widget.cardHolderName,
      cvvCode: widget.cvvCode,
      showBackView: widget.isCvvFocused,
      cardBgColor: lightPrimaryColor,
      isHolderNameVisible: true,
      onCreditCardWidgetChange: (brand) {},
    );
  }
}
