import '../../../shared/typedef/future_result.dart';
import '../entities/simple_card.dart';

abstract class GetLastUsedCardUsecase {
  FutureResult<SimpleCard?> getLastUsedCard();
}
