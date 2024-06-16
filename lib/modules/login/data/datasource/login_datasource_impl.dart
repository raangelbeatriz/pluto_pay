import 'package:plutus_pay/modules/login/data/datasource/login_datasource.dart';
import 'package:plutus_pay/modules/login/data/models/user_model.dart';
import 'package:plutus_pay/modules/login/domain/entities/user.dart';
import 'package:plutus_pay/modules/shared/data/app_network_impl.dart';

import '../../../shared/data/dio/dio_client_impl.dart';

class LoginDatasourceImpl implements LoginDatasource {
  LoginDatasourceImpl({
    required this.dio,
    required this.network,
  });
  final DioClientImpl dio;
  final AppNetworkImpl network;

  @override
  Future<User> signIn({required String email, required String password}) async {
    final response = await dio.post(network.signIn, data: {
      'email': email,
      'password': password,
    });

    return UserModel.fromJson(response.data);
  }
}
