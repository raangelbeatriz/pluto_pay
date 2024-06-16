import 'dio_client.dart';

class DioClientImpl extends DioClient {
  DioClientImpl({
    required super.environment,
    required super.appNetwork,
    required super.mockInterceptor,
  });
}
