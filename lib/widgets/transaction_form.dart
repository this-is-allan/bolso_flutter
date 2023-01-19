import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({super.key});

  final List<TransactionModel> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
