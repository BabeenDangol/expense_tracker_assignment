import 'package:expense_tracker/transaction.dart';
import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class User_Transaction extends StatefulWidget {
  const User_Transaction({super.key});

  @override
  State<User_Transaction> createState() => _User_TransactionState();
}

class _User_TransactionState extends State<User_Transaction> {
  //adding Dummy Data in the List
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

//Void Function to add the new Expense to the list.
  void addTransaction(String title, double amount) {
    var transaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: DateTime.now());
    setState(() {
      transactionList.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransaction), // Widget for adding new transactions
        TransactionList(transactionList), //Widget for the list of expense
      ],
    );
  }
}
