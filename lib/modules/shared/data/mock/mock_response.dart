abstract class MockRequest {
  final dynamic responseJson;
  final int? statusCode;

  MockRequest({
    required this.responseJson,
    this.statusCode,
  });
}
