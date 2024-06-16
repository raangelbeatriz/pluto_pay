import '../../../shared/typedef/future_result.dart';
import '../entities/payment_details.dart';

abstract class GetPaymentDetailsUsecase {
  FutureResult<PaymentDetails> getPaymentDetails({required String url});
}
