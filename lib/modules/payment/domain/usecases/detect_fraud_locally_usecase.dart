import '../entities/transaction.dart';

abstract class DetectFraudLocallyUseCase {
  bool hasPossibleFraud({required DetectFraudLocallyUseCaseParams params});
}

class DetectFraudLocallyUseCaseParams {
  DetectFraudLocallyUseCaseParams({
    required this.transaction,
    required this.hasFraud,
  });

  final Transaction transaction;
  final bool hasFraud;
}
