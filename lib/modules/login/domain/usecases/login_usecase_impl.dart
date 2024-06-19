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
  FutureResult<User> signIn({required LoginUsecaseParams params}) {
    return loginRepository.signIn(params: params);
  }
}
