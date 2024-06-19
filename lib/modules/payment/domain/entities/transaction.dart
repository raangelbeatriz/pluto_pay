class Transaction {
  Transaction({
    required this.cardNumber,
    required this.transactionDate,
    required this.amount,
    required this.deviceId,
  });
  final String cardNumber;
  final DateTime transactionDate;
  final double amount;
  final String? deviceId;
}
