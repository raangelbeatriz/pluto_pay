import '../../modules/shared/data/mock/mock_response.dart';
import '../maps/get_user_has_fraud_map.dart';

class GetUserHasFraudRequest implements MockRequest {
  @override
  get responseJson => getUserHasFraudMap;

  @override
  int? get statusCode => 200;
}
