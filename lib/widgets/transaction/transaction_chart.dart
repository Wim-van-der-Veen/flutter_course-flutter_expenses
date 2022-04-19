import 'package:flutter/material.dart';
import 'package:flutter_expenses/widgets/general/chart_bar.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

class TransactionChart extends StatefulWidget {
  static _TransactionChartState? of(BuildContext context) =>
      context.findAncestorStateOfType<_TransactionChartState>();

  final List<Transaction> _weekTransactions;
  final double _weekTotal;

  TransactionChart._latest(start, transactions, {Key? key})
      : _weekTransactions = List.generate(
          7,
          (index) {
            var date = start.add(Duration(days: index));
            var title = DateFormat.E().format(date);
            var amount = 0.0;
            for (var transaction in transactions) {
              amount += (DateFormat.E().format(transaction.date) == title)
                  ? transaction.amount
                  : 0.0;
            }
            return Transaction(
              id: index.toString(),
              title: title,
              amount: amount,
              date: date,
            );
          },
        ),
        _weekTotal = transactions.fold(0.00001,
            (current, Transaction transaction) => current + transaction.amount),
        super(key: key);

  TransactionChart._start(start, transactions, {Key? key})
      : this._latest(
            start,
            transactions
                .where((Transaction transaction) =>
                    transaction.date.millisecondsSinceEpoch >=
                    start.millisecondsSinceEpoch)
                .toList(),
            key: key);

  TransactionChart._now(now, transactions, {Key? key})
      : this._start(
            DateTime(now.year, now.month, now.day)
                .subtract(const Duration(days: 6)),
            transactions,
            key: key);

  TransactionChart(transactions, {Key? key})
      : this._now(DateTime.now(), transactions, key: key);

  @override
  State<TransactionChart> createState() => _TransactionChartState();
}

class _TransactionChartState extends State<TransactionChart> {
  // BuildContext? _context;
  bool _showChart = true;
  double get height => _showChart ? 40.0 : 160.0;

  void _toggleChart(state) {
    setState(() {
      _showChart = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    // _context = context;
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...(_showChart
                ? [
                    ...widget._weekTransactions
                        .map((transaction) => Flexible(
                              fit: FlexFit.tight,
                              child: ChartBar(
                                  transaction.title,
                                  transaction.amount / widget._weekTotal,
                                  '€ ${transaction.amount.toStringAsFixed(2)}'),
                            ))
                        .toList(),
                    const Spacer(),
                  ]
                : []),
            RotatedBox(
              quarterTurns: 3,
              child: SizedBox(
                height: 20,
                child: Switch(
                  value: _showChart,
                  onChanged: _toggleChart,
                ),
              ),
            ),
          ],
        ),
        // child: Text(
        //   'chart ${_transactions.length.toString()}',
        //   style: Theme.of(context).textTheme.headline4,
        //   textAlign: TextAlign.center,
        // ),
      ),
      elevation: 5,
    );
  }
}
