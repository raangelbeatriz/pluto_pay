class PaymentDetails {
  const PaymentDetails({
    required this.merchantId,
    required this.amount,
    required this.storeName,
  });
  final String merchantId;
  final double amount;
  final String storeName;
}
