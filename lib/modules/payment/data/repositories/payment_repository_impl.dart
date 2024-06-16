import 'package:dartz/dartz.dart';

import '../../../shared/data/errors/failure.dart';
import '../../../shared/typedef/future_result.dart';
import '../../domain/entities/payment_details.dart';
import '../../domain/entities/simple_card.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/payment_datasource.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  PaymentRepositoryImpl({required this.datasource});

  final PaymentDatasource datasource;

  @override
  FutureResult<PaymentDetails> getPaymentDetails({required String url}) async {
    try {
      final result = await datasource.getPaymentDetails(url: url);
      return Right(result);
    } catch (e) {
      return Left(Failure(exception: e));
    }
  }

  @override
  FutureResult<List<SimpleCard>> getRegisterCardsUsecase() async {
    try {
      final result = await datasource.getRegisterCardsUsecase();
      return Right(result);
    } catch (e) {
      return Left(Failure(exception: e));
    }
  }
}
