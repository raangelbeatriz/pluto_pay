import '../../../shared/typedef/future_result.dart';
import '../entities/user.dart';
import '../usecases/login_usecase.dart';

abstract class LoginRepository {
  FutureResult<User> signIn({required LoginUsecaseParams params});
}
