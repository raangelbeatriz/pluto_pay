import 'package:plutus_pay/mock/maps/sign_in_map.dart';
import 'package:plutus_pay/modules/shared/data/mock/mock_response.dart';

class SignInRequest implements MockRequest {
  @override
  get responseJson => signInMap;

  @override
  int? get statusCode => 200;
}
