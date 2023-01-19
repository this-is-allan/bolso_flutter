// Create a dashboard finance screen
// This screen will be the main screen of the app
// It will contain a list of all the transactions
// It will also contain a chart of the last 7 days of transactions
// It will also contain a button to add a new transaction

import 'dart:developer';

import 'package:bolso_taller/widgets/transaction_form.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_list.dart';
// import 'package:bolso_taller/models/transaction.dart';
// import 'package:bolso_taller/widgets/chart.dart';
// import 'package:bolso_taller/widgets/new_transaction.dart';
// import 'package:bolso_taller/widgets/transaction_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<TransactionModel> transactions = [
    TransactionModel(
      id: 1,
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    TransactionModel(
      id: 2,
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
    TransactionModel(
      id: 3,
      title: 'New Shoes',
      amount: 50.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    inspect(txTitle);
    inspect(txAmount);

    final newTx = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      transactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return TransactionForm(addTransaction: _addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bolso Taller'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Chart(),
            TransactionList(transactions: transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        // onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
