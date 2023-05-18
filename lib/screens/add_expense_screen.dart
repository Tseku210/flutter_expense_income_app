import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_ui/components/custom_navigation_bar.dart';
import 'package:green_ui/components/top_bar.dart';
import 'package:green_ui/constants/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

import '../entities/transaction.dart';
import '../providers/transaction_provider.dart';

class AddExpenseScreen extends StatefulWidget {
  static const String routeName = '/expense';

  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  String? _selectedItem;
  double amount = 0;
  DateTime? _selectedDate;
  bool income = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> items = [
      'Netflix',
      'Youtube',
      'Spotify',
      'Apple',
      'Paypal',
      'Google',
    ];

    Map<String, String> logoPaths = {
      'Netflix': 'assets/images/netflix.png',
      'Youtube': 'assets/images/youtube2.png',
      'Spotify': 'assets/images/spotify.png',
      'Apple': 'assets/images/apple2.png',
      'Paypal': 'assets/images/paypal.png',
      'Google': 'assets/images/google.png',
    };

    void selectDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );
      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
        });
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Add Expense"),
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
            children: <Widget>[
              // top bar
              TopBar(size: size),
              // card
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 600,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("NAME",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: grayTextColor,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            DropdownMenu<String>(
                              value: _selectedItem,
                              hint: const Text('Select an option'),
                              items: items.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        logoPaths[item]!,
                                        height: 24,
                                        width: 24,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(item),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedItem = value;
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            const Text("AMOUNT",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: grayTextColor,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                cursorColor: lightPrimaryColor,
                                controller: controller,
                                onChanged: (value) {
                                  setState(() {
                                    if (value == '') {
                                      amount = 0;
                                      controller.text = '';
                                      return;
                                    }
                                    amount = double.parse(value);
                                  });
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d{0,2}')),
                                ],
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: lightPrimaryColor,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: lightPrimaryColor,
                                      width: 2,
                                    ),
                                  ),
                                  hintText: 'Enter amount',
                                  prefixIconColor: lightPrimaryColor,
                                  prefixIcon: const Icon(Icons.attach_money),
                                  suffix: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        amount = 0;
                                      });
                                      controller.text = '';
                                    },
                                    child: const Text(
                                      'Clear',
                                      style: TextStyle(
                                        color: lightPrimaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "DATE",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: grayTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: selectDate,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: 400,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _selectedDate != null
                                          ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                          : 'Select Date',
                                      style:
                                          const TextStyle(color: grayTextColor),
                                    ),
                                    const Icon(Icons.calendar_today,
                                        size: 16, color: Colors.grey)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // switch toggle
                            const Text(
                              "EXPENSE / INCOME",
                              style: TextStyle(
                                fontSize: 12,
                                color: grayTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Switch(
                                value: income,
                                onChanged: (val) {
                                  setState(() {
                                    income = val;
                                  });
                                }),
                            const SizedBox(height: 20),
                            const Text(
                              "INVOICE",
                              style: TextStyle(
                                fontSize: 12,
                                color: grayTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              width: 400,
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                dashPattern: const [8, 4],
                                color: Colors.grey,
                                radius: const Radius.circular(5),
                                padding: const EdgeInsets.all(0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 400,
                                  child: TextButton.icon(
                                    onPressed: () {
                                      if (_selectedItem != null &&
                                          amount != 0 &&
                                          _selectedDate != null) {
                                        Provider.of<TransactionProvider>(
                                                context,
                                                listen: false)
                                            .addTransaction(
                                          Transaction(
                                            id: DateTime.now().toString(),
                                            title: _selectedItem!,
                                            image: logoPaths[_selectedItem!]!,
                                            income: income,
                                            amount: amount,
                                            date: _selectedDate!,
                                          ),
                                        );
                                        Navigator.pop(context);
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 80),
                                      foregroundColor: grayTextColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    icon: const Icon(Icons.add_circle),
                                    label: const Text('Upload Invoice'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
      // bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}

class DropdownMenu<T> extends StatefulWidget {
  final T? value;
  final Widget? hint;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;

  const DropdownMenu({
    super.key,
    this.value,
    this.hint,
    required this.items,
    this.onChanged,
  });

  @override
  State<DropdownMenu<T>> createState() => _DropdownMenuState<T>();
}

class _DropdownMenuState<T> extends State<DropdownMenu<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: 400,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: DropdownButton<T>(
          value: widget.value,
          hint: widget.hint,
          items: widget.items,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
