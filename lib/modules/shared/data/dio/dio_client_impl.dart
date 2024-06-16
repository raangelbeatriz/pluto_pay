import 'package:plutus_pay/modules/shared/data/dio/dio_client.dart';

class DioClientImpl extends DioClient {
  DioClientImpl({
    required super.environment,
    required super.appNetwork,
    required super.mockInterceptor,
  });
}
