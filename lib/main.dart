import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_new.dart';
import './widgets/transaction_chart.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeData defaultTheme = ThemeData(
    fontFamily: 'Quicksand',
  );

  @override
  Widget build(BuildContext context) {
    final appTheme = defaultTheme.copyWith(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.indigo,
            secondary: Colors.amber,
          ),
    );
    return MaterialApp(
      title: 'Flutter Expenses App',
      theme: appTheme.copyWith(
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: appTheme.colorScheme.secondary,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(id: '1', title: 'item 1', amount: 12.34, date: DateTime.now()),
    // Transaction(id: '2', title: 'item 2', amount: 13.57, date: DateTime.now()),
  ];

  final Icon _actionIcon = const Icon(Icons.add);

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          child: TransactionNew(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FlutterExpenses Home',
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: _actionIcon,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransactionChart(_userTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: _actionIcon,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
