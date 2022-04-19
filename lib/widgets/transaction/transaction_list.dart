import 'package:flutter/material.dart';

import '../../models/transaction.dart';
import './transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;
  final double _unusableHeight;

  const TransactionList(
      this._transactions, this._deleteTransaction, this._unusableHeight,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - _unusableHeight,
      child: _transactions.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) =>
                  TransactionCard(_transactions[index], _deleteTransaction),
              itemCount: _transactions.length,
            )
          : Column(children: <Widget>[
              Text(
                'no transactions yet',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 250,
                child:
                    Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
              ),
            ]),
      // child: ListView(
      //   children: _transactions
      //       .map((transaction) => TransactionCard(transaction))
      //       .toList(),
      // ),
    );
  }
}
