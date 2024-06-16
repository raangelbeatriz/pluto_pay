import '../../modules/shared/data/mock/mock_response.dart';
import '../maps/sign_in_map.dart';

class SignInRequest implements MockRequest {
  @override
  get responseJson => signInMap;

  @override
  int? get statusCode => 200;
}
