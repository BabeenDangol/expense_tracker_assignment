import 'package:expense_tracker/chart.dart';

import 'package:flutter/material.dart';
import './transaction.dart';

import './transaction_list.dart';
import 'new_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//providing Values for the list
  List<Transaction> transactionList = [
    Transaction(
      id: "1",
      title: "Recharge",
      amount: 100,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: '1',
      title: "Lunch",
      amount: 100,
      dateTime: DateTime.now(),
    ),
  ];

  List<Transaction> get recentTransaction {
    return transactionList.where((tx) {
      //gets the transaction of last 7 days
      return tx.dateTime.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  // Add a new transaction to the list
  void _addTransaction(String title, double amount) {
    var transaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: DateTime.now());
    setState(() {
      transactionList.add(transaction);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    print("Hello");
    showModalBottomSheet(
      context: context,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.purple, accentColor: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personal Expenses"),
          actions: <Widget>[
            IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            Chart(recentTransaction),
            //User_Transaction(),
            TransactionList(transactionList),
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => _startAddNewTransaction(context),
            child: Icon(Icons.add),
          ),
          //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
