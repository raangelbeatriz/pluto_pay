import '../../../shared/typedef/future_result.dart';
import '../entities/user.dart';

abstract class LoginRepository {
  FutureResult<User> signIn({required String email, required String password});
}
