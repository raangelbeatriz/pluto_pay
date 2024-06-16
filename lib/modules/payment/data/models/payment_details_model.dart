import '../../domain/entities/payment_details.dart';

class PaymentDetailsModel extends PaymentDetails {
  PaymentDetailsModel({
    required super.merchantId,
    required super.amount,
    required super.storeName,
  });

  factory PaymentDetailsModel.fromJson(Map<String, dynamic> json) {
    return PaymentDetailsModel(
      merchantId: json['merchant_id'],
      amount: json['amount'],
      storeName: json['store_name'],
    );
  }
}
