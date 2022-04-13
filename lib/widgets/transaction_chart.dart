import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> _transactions;

  const TransactionChart(this._transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(6),
        child: Text(
          'chart ${_transactions.length.toString()}',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ),
      elevation: 5,
    );
  }
}
