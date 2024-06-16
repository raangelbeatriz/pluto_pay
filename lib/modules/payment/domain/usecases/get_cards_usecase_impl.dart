import '../../../shared/typedef/future_result.dart';
import '../entities/simple_card.dart';
import '../repositories/payment_repository.dart';
import 'get_cards_usecase.dart';

class GetCardsUsecaseImpl implements GetCardsUsecase {
  GetCardsUsecaseImpl({required this.repository});

  final PaymentRepository repository;
  @override
  FutureResult<List<SimpleCard>> getRegisterCardsUsecase() async {
    return repository.getRegisterCardsUsecase();
  }
}
