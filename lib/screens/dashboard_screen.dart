import 'dart:developer';

import 'package:bolso_taller/widgets/transaction_form.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_list.dart';

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
      transactionType: TransactionType.income,
    ),
    TransactionModel(
      id: 2,
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
      transactionType: TransactionType.income,
    ),
    TransactionModel(
      id: 3,
      title: 'New Shoes',
      amount: 50.99,
      date: DateTime.now(),
      transactionType: TransactionType.outcome,
    ),
  ];

  void _addNewTransaction(
      String txTitle, double txAmount, TransactionType transactionType) {
    final newTx = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      transactionType: transactionType,
    );

    setState(() {
      transactions.add(newTx);
    });

    log('New transaction added');
  }

  void _startAddNewTransaction(
      BuildContext ctx, TransactionType transactionType) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return TransactionForm(
            addTransaction: _addNewTransaction,
            transactionType: transactionType);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bolso Taller'),
      ),
      body: Column(
        children: [
          // Chart(),
          Expanded(
            child: TransactionList(transactions: transactions),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () =>
                _startAddNewTransaction(context, TransactionType.income),
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () =>
                _startAddNewTransaction(context, TransactionType.outcome),
            backgroundColor: Colors.red,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
