import 'package:dartz/dartz.dart';

import '../../../shared/data/errors/failure.dart';
import '../../../shared/typedef/future_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../datasource/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({required this.datasource});

  final LoginDatasource datasource;

  @override
  FutureResult<User> signIn({required LoginUsecaseParams params}) async {
    try {
      final result = await datasource.signIn(params: params);
      return Right(result);
    } catch (e) {
      return Left(Failure(exception: e));
    }
  }
}
