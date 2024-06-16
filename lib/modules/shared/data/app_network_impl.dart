import '../configs/enviroment.dart';
import 'app_network.dart';

class AppNetworkImpl implements AppNetwork {
  const AppNetworkImpl({required this.environment});

  @override
  final Environment environment;

  @override
  String get baseUrl => environment.baseUrl;

  String get signIn => '';
}
