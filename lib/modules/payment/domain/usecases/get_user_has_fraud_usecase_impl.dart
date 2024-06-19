import '../../../shared/typedef/future_result.dart';
import '../repositories/payment_repository.dart';
import 'get_user_has_fraud_usecase.dart';

class GetUserHasFraudUsecaseImpl implements GetUserHasFraudUsecase {
  GetUserHasFraudUsecaseImpl({required this.repository});

  final PaymentRepository repository;

  @override
  FutureResult<bool> getUserHasFraudUsecase() {
    return repository.getUserHasFraud();
  }
}
