import '../../../shared/typedef/future_result.dart';
import '../entities/simple_card.dart';

abstract class GetCardsUsecase {
  FutureResult<List<SimpleCard>> getRegisterCardsUsecase();
}
