import '../../modules/shared/data/mock/mock_response.dart';
import '../maps/get_cards_map.dart';

class GetCardsRequest implements MockRequest {
  @override
  get responseJson => getCardsMap;

  @override
  int? get statusCode => 200;
}
