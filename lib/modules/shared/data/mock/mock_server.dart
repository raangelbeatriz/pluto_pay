import '../app_network.dart';
import 'mock_response.dart';

abstract class MockServer<T extends AppNetwork> {
  final T appNetwork;

  MockServer({
    required this.appNetwork,
  });

  Map<String, MockRequest> get requests => {};
}
