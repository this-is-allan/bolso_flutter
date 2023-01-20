enum TransactionType { income, outcome }

class TransactionModel {
  late final int id;
  late final String title;
  late final double amount;
  late final DateTime date;
  late final TransactionType transactionType;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.transactionType,
  });
}
