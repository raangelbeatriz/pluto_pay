import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';

abstract class LoginDatasource {
  Future<User> signIn({required LoginUsecaseParams params});
}
