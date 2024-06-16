import 'enviroment.dart';

class MockEnvironment implements Environment {
  @override
  String suffix = 'mock';

  @override
  String baseUrl = '';

  @override
  bool get isMock => true;

  @override
  String? get certificatePath => null;
}

class DevEnvironment implements Environment {
  @override
  String suffix = 'dev';

  @override
  String baseUrl = 'https://dog.ceo/api/breeds/image/random';

  @override
  bool get isMock => false;

  @override
  String? get certificatePath => null;
}
