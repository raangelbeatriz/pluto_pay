import '../../domain/entities/user.dart';

abstract class LoginDatasource {
  Future<User> signIn({required String email, required String password});
}
