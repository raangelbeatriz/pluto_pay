import '../../../shared/data/app_network_impl.dart';
import '../../../shared/data/dio/dio_client.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../models/user_model.dart';
import 'login_datasource.dart';

class LoginDatasourceImpl implements LoginDatasource {
  LoginDatasourceImpl({
    required this.dio,
    required this.network,
  });
  final DioClient dio;
  final AppNetworkImpl network;

  @override
  Future<User> signIn({required LoginUsecaseParams params}) async {
    final response = await dio.post(
      network.signIn,
      data: {
        'email': params.email,
        'password': params.password,
      },
    );

    return UserModel.fromJson(response.data);
  }
}
