import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction _transaction;
  const TransactionCard(this._transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(12),
            child: Text(
              '€ ${_transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    _transaction.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(),
                  ),
                  child: Text(DateFormat.yMMMd().format(_transaction.date),
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
      elevation: 5,
    );
  }
}
