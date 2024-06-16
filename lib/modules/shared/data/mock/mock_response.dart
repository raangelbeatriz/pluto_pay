abstract class MockRequest {

  MockRequest({
    required this.responseJson,
    this.statusCode,
  });
  final dynamic responseJson;
  final int? statusCode;
}
