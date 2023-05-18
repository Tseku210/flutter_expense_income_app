import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../entities/transaction.dart';

class TransactionProvider with ChangeNotifier {
  final url = Uri.https('finance-flutter-app-ed66d-default-rtdb.firebaseio.com',
      '/transactions.json');

  double balance = 0;
  double expense = 0;
  double income = 0;

  List<Transaction> _transactions = [];
  List<Transaction> _bills = [];

  List<Transaction> get transactions {
    return [..._transactions];
  }

  List<Transaction> get bills {
    return [..._bills];
  }

  double get totalBalance {
    return balance;
  }

  double get totalExpense {
    return expense;
  }

  double get totalIncome {
    return income;
  }

  double calculateTotalBalance() {
    double total = 0;
    for (var transaction in _transactions) {
      transaction.income
          ? total += transaction.amount
          : total -= transaction.amount;
    }
    return total;
  }

  double calculateTotalIncome() {
    double totalIncome = 0;
    for (var transaction in _transactions) {
      if (transaction.income) {
        totalIncome += transaction.amount;
      }
    }
    return totalIncome;
  }

  double calculateTotalExpenses() {
    double totalExpenses = 0;
    for (var transaction in _transactions) {
      if (!transaction.income) {
        totalExpenses += transaction.amount;
      }
    }
    return totalExpenses;
  }

  Future<void> addTransaction(Transaction transaction) async {
    try {
      await http.post(url, body: json.encode(transaction.toJson()));
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchTransactions() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Transaction> loadedTransactions = [];
        final List<Transaction> loadedBills = [];
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
        if (extractedData == null) {
          return;
        }
        extractedData.forEach((transactionId, transactionData) {
          loadedTransactions.add(Transaction(
            id: transactionId,
            title: transactionData['title'],
            image: transactionData['image'],
            income: transactionData['income'],
            amount: transactionData['amount'],
            date: DateTime.parse(transactionData['date']),
          ));
          if (!transactionData['income']) {
            loadedBills.add(Transaction(
              id: transactionId,
              title: transactionData['title'],
              image: transactionData['image'],
              income: transactionData['income'],
              amount: transactionData['amount'],
              date: DateTime.parse(transactionData['date']),
            ));
          }
        });
        _transactions = loadedTransactions;
        _bills = loadedBills;
        balance = calculateTotalBalance();
        expense = calculateTotalExpenses();
        income = calculateTotalIncome();

        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Transaction>> fetchTransactionsToList() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Transaction> loadedTransactions = [];
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;

        extractedData.forEach((transactionId, transactionData) {
          loadedTransactions.add(Transaction(
            id: transactionId,
            title: transactionData['title'],
            image: transactionData['image'],
            income: transactionData['income'],
            amount: transactionData['amount'],
            date: DateTime.parse(transactionData['date']),
          ));
        });
        _transactions = loadedTransactions;
        balance = calculateTotalBalance();
        expense = calculateTotalExpenses();
        income = calculateTotalIncome();

        return _transactions;
      }

      return [];
    } catch (error) {
      rethrow;
    }
  }
}
