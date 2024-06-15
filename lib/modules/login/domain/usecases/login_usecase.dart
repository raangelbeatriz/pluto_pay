import 'package:plutus_pay/modules/login/domain/entities/user.dart';
import 'package:plutus_pay/modules/shared/typedef/future_result.dart';

abstract class LoginUsecase {
  FutureResult<User> signIn({required String email, required String password});
}
