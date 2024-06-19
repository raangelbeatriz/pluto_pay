import '../../../shared/typedef/future_result.dart';
import '../entities/simple_card.dart';
import '../repositories/payment_repository.dart';
import 'get_last_used_card_usecase.dart';

class GetLastUsedCarUsecaseImpl implements GetLastUsedCardUsecase {
  GetLastUsedCarUsecaseImpl({required this.repository});

  final PaymentRepository repository;
  @override
  FutureResult<SimpleCard?> getLastUsedCard() async {
    return repository.getLastUsedCard();
  }
}
