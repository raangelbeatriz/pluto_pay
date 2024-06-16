import 'package:dartz/dartz.dart';
import 'package:plutus_pay/modules/login/data/datasource/login_datasource.dart';
import 'package:plutus_pay/modules/login/domain/entities/user.dart';
import 'package:plutus_pay/modules/login/domain/repositories/login_repository.dart';
import 'package:plutus_pay/modules/shared/data/errors/failure.dart';
import 'package:plutus_pay/modules/shared/typedef/future_result.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({required this.datasource});

  final LoginDatasource datasource;

  @override
  FutureResult<User> signIn({required String email, required String password}) async {
    try {
      final result = await datasource.signIn(email: email, password: password);
      return Right(result);
    } catch (e) {
      return Left(Failure(exception: e));
    }
  }
}
