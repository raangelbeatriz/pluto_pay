import '../entities/transaction.dart';
import 'detect_fraud_locally_usecase.dart';

class DetectFraudLocallyUsecaseImpl implements DetectFraudLocallyUseCase {
  final peakHourFraudStart = 19;
  final peakHourFraudFinish = 1;
  final suspectValue = 2000;

  @override
  bool hasPossibleFraud({required DetectFraudLocallyUseCaseParams params}) {
    if (params.hasFraud) return true;

    if (_isPeakHour(params.transaction)) {
      if (_hasSuspectValue(params.transaction)) return true;
    }

    return false;
  }

  bool _isPeakHour(Transaction transaction) {
    final hour = transaction.transactionDate.hour;
    if (peakHourFraudFinish < peakHourFraudStart) {
      return hour >= peakHourFraudStart || hour < peakHourFraudFinish;
    } else {
      return hour >= peakHourFraudStart && hour < peakHourFraudFinish;
    }
  }

  bool _hasSuspectValue(Transaction transaction) {
    return transaction.amount >= suspectValue;
  }
}
