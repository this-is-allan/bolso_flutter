import 'package:flutter/material.dart';

import '../helpers/utils.dart';
import '../models/transaction.dart';

class TransactionAmountCard extends StatelessWidget {
  final double amount;
  final TransactionType transactionType;

  const TransactionAmountCard(
      {super.key, required this.amount, required this.transactionType});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transactionType == TransactionType.income
                  ? 'Receitas'
                  : 'Despesas'),
              const SizedBox(height: 5),
              Text(
                amountFormatted(amount),
                style: TextStyle(
                    color: getTypeColor(transactionType), fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
