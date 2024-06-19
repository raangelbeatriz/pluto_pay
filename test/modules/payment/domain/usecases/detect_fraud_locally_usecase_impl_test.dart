import 'package:flutter_test/flutter_test.dart';
import 'package:plutus_pay/modules/payment/domain/usecases/detect_fraud_locally_usecase.dart';
import 'package:plutus_pay/modules/payment/domain/usecases/detect_fraud_locally_usecase_impl.dart';

import '../../../mocks.dart';

void main() {
  late DetectFraudLocallyUseCase detectFraudLocallyUseCase;

  setUp(() {
    detectFraudLocallyUseCase = DetectFraudLocallyUsecaseImpl();
  });

  group('when [hasPossibleFraud] is called', () {
    test('should return true when hasFraud is true', () {
      final params = DetectFraudLocallyUseCaseParams(transaction: transactionMock, hasFraud: true);

      final result = detectFraudLocallyUseCase.hasPossibleFraud(params: params);

      expect(result, true);
    });

    test('should return true when transaction is during peak hour and amount is suspect', () {
      final params = DetectFraudLocallyUseCaseParams(
        transaction: transactionWithPeakHourMock,
        hasFraud: false,
      );

      final result = detectFraudLocallyUseCase.hasPossibleFraud(params: params);

      expect(result, true);
    });

    test('should return false when transaction is during peak hour but amount is not suspect', () {
      final params = DetectFraudLocallyUseCaseParams(
        transaction: transactionWithPeakHourAndNotSuspectAmountMock,
        hasFraud: false,
      );

      final result = detectFraudLocallyUseCase.hasPossibleFraud(params: params);

      expect(result, false);
    });

    test('should return false when transaction is not during peak hour and amount is suspect', () {
      final params = DetectFraudLocallyUseCaseParams(
        transaction: transactionWithoutPeakHourAndSuspectAmountMock,
        hasFraud: false,
      );

      final result = detectFraudLocallyUseCase.hasPossibleFraud(params: params);

      expect(result, false);
    });

    test('should return false when transaction is not during peak hour and amount is not suspect',
        () {
      final params = DetectFraudLocallyUseCaseParams(
        transaction: transactionNormalTimeAndAmountMock,
        hasFraud: false,
      );

      final result = detectFraudLocallyUseCase.hasPossibleFraud(params: params);

      expect(result, false);
    });
  });
}
