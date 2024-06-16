import '../../../shared/typedef/future_result.dart';
import '../entities/payment_details.dart';
import '../repositories/payment_repository.dart';
import 'get_payment_details.dart';

class GetPaymentDetailsUsecaseImpl implements GetPaymentDetailsUsecase {
  const GetPaymentDetailsUsecaseImpl({required this.repository});

  final PaymentRepository repository;

  @override
  FutureResult<PaymentDetails> getPaymentDetails({required String url}) async {
    return repository.getPaymentDetails(url: url);
  }
}
