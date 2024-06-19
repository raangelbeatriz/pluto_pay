import '../../../shared/typedef/future_result.dart';
import '../entities/user.dart';

abstract class LoginUsecase {
  FutureResult<User> signIn({required LoginUsecaseParams params});
}

class LoginUsecaseParams {
  LoginUsecaseParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
