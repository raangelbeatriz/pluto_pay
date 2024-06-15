import 'package:plutus_pay/modules/login/domain/entities/user.dart';

abstract class LoginDatasource {
  Future<User> signIn({required String email, required String password});
}
