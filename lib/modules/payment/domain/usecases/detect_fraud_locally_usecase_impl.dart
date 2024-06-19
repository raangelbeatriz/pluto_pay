import '../entities/transaction.dart';
import 'detect_fraud_locally_usecase.dart';

class DetectFraudLocallyUsecaseImpl implements DetectFraudLocallyUseCase {
  final peakHourFraudStart = 19;
  final peakHourFraudFinish = 3;
  final suspectValue = 2000;
  @override
  bool hasPossibleFraud({required Transaction transaction, required bool hasFraud}) {
    if (hasFraud) return true;

    if (_isPeakHour(transaction)) {
      if (_hasSuspectValue(transaction)) return true;
    }

    return false;
  }

  bool _isPeakHour(Transaction transaction) {
    final hour = transaction.transactionDate.hour;
    return hour >= peakHourFraudStart && hour <= peakHourFraudFinish;
  }

  bool _hasSuspectValue(Transaction transaction) {
    return transaction.amount >= suspectValue;
  }
}
