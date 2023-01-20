import 'dart:developer';

import 'package:bolso_taller/widgets/transaction_amount_card.dart';
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
      String title, double amount, TransactionType transactionType) {
    final newTransaction = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      amount: amount,
      date: DateTime.now(),
      transactionType: transactionType,
    );

    setState(() {
      transactions.add(newTransaction);
    });

    log('New transaction added');
  }

  void _createTransaction(BuildContext ctx, TransactionType transactionType) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return TransactionForm(
            addTransaction: _addNewTransaction,
            transactionType: transactionType);
      },
    );
  }

  double get totalOutcomes {
    return transactions
        .where((transaction) =>
            transaction.transactionType == TransactionType.outcome)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  double get totalIncomes {
    return transactions
        .where((transaction) =>
            transaction.transactionType == TransactionType.income)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bolso Taller'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TransactionAmountCard(
                    amount: totalIncomes,
                    transactionType: TransactionType.income),
                TransactionAmountCard(
                    amount: totalOutcomes,
                    transactionType: TransactionType.outcome),
              ],
            ),
          ),
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
                _createTransaction(context, TransactionType.income),
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () =>
                _createTransaction(context, TransactionType.outcome),
            backgroundColor: Colors.red,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
