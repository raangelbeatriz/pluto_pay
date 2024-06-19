import '../../modules/shared/data/mock/mock_response.dart';
import '../maps/get_last_used_card.dart';

class GetLastUsedCardRequest implements MockRequest {
  @override
  get responseJson => getLastUsedCardMap;

  @override
  int? get statusCode => 200;
}
