import '../../../shared/typedef/future_result.dart';
import '../entities/card.dart';
import '../entities/simple_card.dart';

abstract class RegisterCardUsecase {
  FutureResult<SimpleCard> registerCard({required Card card});
}
