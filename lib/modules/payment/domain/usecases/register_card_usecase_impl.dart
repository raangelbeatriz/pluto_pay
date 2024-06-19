import '../../../shared/typedef/future_result.dart';
import '../entities/card.dart';
import '../entities/simple_card.dart';
import '../repositories/payment_repository.dart';
import 'register_card_usecase.dart';

class RegisterCardUsecaseImpl implements RegisterCardUsecase {
  RegisterCardUsecaseImpl({required this.repository});

  final PaymentRepository repository;

  @override
  FutureResult<SimpleCard> registerCard({required Card card}) {
    return repository.registerCard(card: card);
  }
}
