import 'package:plutus_pay/modules/login/domain/entities/user.dart';
import 'package:plutus_pay/modules/login/domain/usecases/login_usecase.dart';
import 'package:plutus_pay/modules/shared/typedef/future_result.dart';

import '../repositories/login_repository.dart';

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository loginRepository;

  LoginUsecaseImpl({
    required this.loginRepository,
  });
  @override
  FutureResult<User> signIn({required String email, required String password}) {
    return loginRepository.signIn(email: email, password: password);
  }
}
