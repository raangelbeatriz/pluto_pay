import '../../modules/shared/data/mock/mock_response.dart';
import '../maps/register_card_map.dart';

class RegisterCardUsecaseRequest implements MockRequest {
  @override
  get responseJson => registerCardMap;

  @override
  int? get statusCode => 200;
}
