import '../app_network.dart';
import 'mock_response.dart';

abstract class MockServer<T extends AppNetwork> {

  MockServer({
    required this.appNetwork,
  });
  final T appNetwork;

  Map<String, MockRequest> get requests => {};
}
