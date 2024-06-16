import 'package:dio/dio.dart';

import 'mock_response.dart';
import 'mock_server.dart';

class MockInterceptor extends Interceptor {
  final List<MockServer> mockServer;

  MockInterceptor({
    required this.mockServer,
  });

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final path = options.path.replaceAll('https://mock', '');

      await Future.delayed(const Duration(seconds: 1));

      final mockRequest = _validateRequest(path);
      if (mockRequest == null) {
        _rejectRequest(
          options,
          handler,
          message: 'The endpoint $path doesn\'t exist on mock_server.dart',
        );
        return;
      }

      final response = Response(
        data: mockRequest.responseJson,
        requestOptions: options,
        statusCode: mockRequest.statusCode,
      );

      handler.resolve(response, true);
    } catch (error) {
      _rejectRequest(options, handler, message: error.toString());
    }
  }

  MockRequest? _validateRequest(String path) {
    for (var server in mockServer) {
      if (server.requests[path] != null) return server.requests[path];
    }
    return null;
  }

  void _rejectRequest(
    RequestOptions options,
    RequestInterceptorHandler handler, {
    String? message,
    DioExceptionType type = DioExceptionType.badResponse,
    Response? response,
  }) {
    final error = DioException(
      requestOptions: options,
      type: type,
      response: response ??
          Response(
            requestOptions: options,
            data: {'message': message},
          ),
    );
    handler.reject(error);
  }
}
