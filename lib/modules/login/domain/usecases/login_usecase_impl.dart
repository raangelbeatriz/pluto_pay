import '../../../shared/typedef/future_result.dart';
import '../entities/user.dart';
import '../repositories/login_repository.dart';
import 'login_usecase.dart';

class LoginUsecaseImpl implements LoginUsecase {

  LoginUsecaseImpl({
    required this.loginRepository,
  });
  final LoginRepository loginRepository;
  @override
  FutureResult<User> signIn({required String email, required String password}) {
    return loginRepository.signIn(email: email, password: password);
  }
}
