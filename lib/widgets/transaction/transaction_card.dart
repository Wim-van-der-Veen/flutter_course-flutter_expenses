import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction _transaction;
  final Function _deleteTransaction;
  const TransactionCard(this._transaction, this._deleteTransaction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          const Spacer(flex: 1),
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
          const Spacer(flex: 1),
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
          const Spacer(flex: 1),
          MediaQuery.of(context).size.width > 500
              ? ElevatedButton(
                  onPressed: () => _deleteTransaction(_transaction.id),
                  child: Row(
                    children: const [
                      Text(
                        'delete',
                      ),
                      Icon(Icons.delete),
                    ],
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).errorColor)))
              : IconButton(
                  onPressed: () => _deleteTransaction(_transaction.id),
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                )
        ],
      ),
      elevation: 5,
    );
  }
}
