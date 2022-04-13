import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_chart.dart';
import '../widgets/transaction_list.dart';
import '../widgets/transaction_new.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: '1', title: 'item 1', amount: 12.34, date: DateTime.now()),
    Transaction(id: '2', title: 'item 2', amount: 13.57, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      amount: amount,
      title: title,
      date: DateTime.now(),
      id: _userTransactions.length.toString(),
    );
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TransactionChart(_userTransactions),
          TransactionNew(_addNewTransaction),
          TransactionList(_userTransactions),
        ],
      ),
    );
  }
}
