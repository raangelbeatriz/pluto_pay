import '../../../shared/typedef/future_result.dart';
import '../entities/card.dart';
import '../entities/payment_details.dart';
import '../entities/simple_card.dart';

abstract class PaymentRepository {
  FutureResult<PaymentDetails> getPaymentDetails({required String url});
  FutureResult<List<SimpleCard>> getRegisterCardsUsecase();
  FutureResult<SimpleCard> registerCard({required Card card});
  FutureResult<SimpleCard?> getLastUsedCard();
  FutureResult<bool> getUserHasFraud();
}
