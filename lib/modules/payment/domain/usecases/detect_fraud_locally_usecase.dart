import '../entities/transaction.dart';

abstract class DetectFraudLocallyUseCase {
  bool hasPossibleFraud({required Transaction transaction, required bool hasFraud});
}
