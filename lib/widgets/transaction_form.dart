import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatelessWidget {
  final Function addTransaction;

  const TransactionForm({super.key, required this.addTransaction});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    return Container(
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(labelText: 'Amount'),
          ),
          TextButton(
            onPressed: () {
              log('Add Transaction');
              final title = titleController.text;
              final amount = double.parse(amountController.text);

              addTransaction(title, amount);
            },
            child: const Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
