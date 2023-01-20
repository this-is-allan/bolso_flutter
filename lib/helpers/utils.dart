import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

String amountFormatted(double value) => NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    ).format(value);

Color getTypeColor(TransactionType transactionType) {
  if (transactionType == TransactionType.income) {
    return Colors.green;
  }

  return Colors.red;
}
