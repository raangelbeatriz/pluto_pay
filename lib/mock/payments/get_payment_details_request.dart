import '../../modules/shared/data/mock/mock_response.dart';
import '../maps/get_payments_details_map.dart';

class GetPaymentDetailsRequest implements MockRequest {
  @override
  get responseJson => getPaymentDetailsMap;

  @override
  int? get statusCode => 200;
}
