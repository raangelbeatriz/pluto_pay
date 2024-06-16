import '../configs/enviroment.dart';

abstract class AppNetwork {
  AppNetwork({
    required this.environment,
  }) : baseUrl = environment.baseUrl;

  final Environment environment;

  final String baseUrl;
}
