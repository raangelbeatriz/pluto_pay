import '../../domain/entities/card.dart';
import '../../domain/entities/payment_details.dart';
import '../../domain/entities/simple_card.dart';

abstract class PaymentDatasource {
  Future<PaymentDetails> getPaymentDetails({required String url});
  Future<List<SimpleCard>> getRegisterCardsUsecase();
  Future<SimpleCard> registerCard({required Card card});
  Future<SimpleCard?> getLastUsedCard();
  Future<bool> getUserHasFraud();
}
