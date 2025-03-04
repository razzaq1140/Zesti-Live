class Transaction {
  final double amount;
  final String paymentMethod;
  final String transactionId;
  final DateTime transactionDate;

  Transaction({
    required this.amount,
    required this.paymentMethod,
    required this.transactionId,
    required this.transactionDate,
  });
}
