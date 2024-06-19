import 'package:dartz/dartz.dart';

import '../../domain/repositories/shared_repository.dart';
import '../../typedef/future_result.dart';
import '../datasources/shared_local_datasource.dart';
import '../errors/failure.dart';

class SharedRepositoryImpl implements SharedRepository {
  SharedRepositoryImpl({required this.sharedLocalDatasource});

  final SharedLocalDatasource sharedLocalDatasource;

  @override
  FutureResult<String> getDeviceId() async {
    try {
      final result = await sharedLocalDatasource.getDeviceId();
      return Right(result);
    } catch (e) {
      return Left(Failure(exception: e));
    }
  }
}
