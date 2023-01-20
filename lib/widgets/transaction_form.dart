import 'dart:developer';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/transaction.dart';

final titleController = TextEditingController();
final amountController = TextEditingController();

final CurrencyTextInputFormatter currencyFormatter = CurrencyTextInputFormatter(
  locale: 'pt_BR',
  decimalDigits: 2,
  symbol: 'R\$',
);

class TransactionForm extends StatelessWidget {
  final Function addTransaction;
  final TransactionType transactionType;

  const TransactionForm({
    super.key,
    required this.addTransaction,
    required this.transactionType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
                transactionType == TransactionType.income
                    ? 'Nova receita'
                    : 'Nova despesa',
                style: Theme.of(context).textTheme.headline6),
          ),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextFormField(
            controller: amountController,
            decoration: const InputDecoration(labelText: 'Amount'),
            inputFormatters: <TextInputFormatter>[currencyFormatter],
            keyboardType: TextInputType.number,
          ),
          TextButton(
            onPressed: () {
              log('Criar $transactionType');
              final title = titleController.text;
              final amount = currencyFormatter.getUnformattedValue();

              addTransaction(title, amount, transactionType);

              Navigator.of(context).pop();

              titleController.clear();
              amountController.clear();
            },
            child: Text(transactionType == TransactionType.income
                ? 'Criar receita'
                : 'Criar despesa'),
          ),
        ],
      ),
    );
  }
}
