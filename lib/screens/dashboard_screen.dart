// Create a dashboard finance screen
// This screen will be the main screen of the app
// It will contain a list of all the transactions
// It will also contain a chart of the last 7 days of transactions
// It will also contain a button to add a new transaction

import 'package:bolso_taller/widgets/transaction_form.dart';
import 'package:flutter/material.dart';

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
            TransactionList(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // onPressed: () => _startAddNewTransaction(context),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
