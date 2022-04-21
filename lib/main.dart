import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './models/transaction.dart';
import './widgets/transaction/transaction_new.dart';
import './widgets/transaction/transaction_chart.dart';
import './widgets/transaction/transaction_list.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
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
    Transaction(
      id: '1',
      title: 'item 1',
      amount: 12.34,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      id: '2',
      title: 'item 2',
      amount: 13.57,
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Transaction(
      id: '3',
      title: 'item 3',
      amount: 98.76,
      date: DateTime.now().subtract(const Duration(days: 8)),
    ),
  ];

  final Icon _actionIcon = const Icon(Icons.add);

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          child: TransactionNew(_addTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _addTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      amount: amount,
      title: title,
      date: date,
      id: _userTransactions.length.toString(),
    );
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions
          .removeWhere((Transaction transaction) => transaction.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    const title = Text(
      'FlutterExpenses Home',
    );

    final ObstructingPreferredSizeWidget appBarIos = CupertinoNavigationBar(
      middle: title,
      trailing: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => _startAddNewTransaction(context),
            child: const Icon(CupertinoIcons.add),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
    final PreferredSizeWidget appBarAndroid = AppBar(
      title: title,
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: _actionIcon,
        ),
      ],
    );
    final PreferredSizeWidget appBar =
        Platform.isIOS ? appBarIos : appBarAndroid;
    final chart = TransactionChart(_userTransactions, isLandscape);
    final body = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            chart,
            TransactionList(
              _userTransactions,
              _deleteTransaction,
              mediaQuery.padding.top +
                  mediaQuery.padding.bottom +
                  appBar.preferredSize.height +
                  (TransactionChart.of(context) == null
                      ? 0.0
                      : TransactionChart.of(context)!.height),
            ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: body,
            navigationBar: appBarIos,
          )
        : Scaffold(
            appBar: appBarAndroid,
            body: body,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () => _startAddNewTransaction(context),
              child: _actionIcon,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          );
  }
}
