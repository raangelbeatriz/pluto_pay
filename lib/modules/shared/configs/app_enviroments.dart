import 'enviroment.dart';

class MockEnvironment implements Environment {
  @override
  String suffix = 'mock';

  @override
  String baseUrl = '';

  @override
  bool get isMock => true;
}

class DevEnvironment implements Environment {
  @override
  String suffix = 'dev';

  @override
  String baseUrl = '';

  @override
  bool get isMock => false;
}
