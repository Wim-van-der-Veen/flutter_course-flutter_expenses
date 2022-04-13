import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  const TransactionList(this._transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: _transactions.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) =>
                  TransactionCard(_transactions[index]),
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
