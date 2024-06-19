import '../../../shared/data/app_network_impl.dart';
import '../../../shared/data/dio/dio_client.dart';
import '../../domain/entities/card.dart';
import '../../domain/entities/payment_details.dart';
import '../../domain/entities/simple_card.dart';
import '../models/payment_details_model.dart';
import '../models/simple_card_model.dart';
import 'payment_datasource.dart';

class PaymentDatasourceImpl implements PaymentDatasource {
  PaymentDatasourceImpl({
    required this.dio,
    required this.appNetwork,
  });

  final DioClient dio;
  final AppNetworkImpl appNetwork;

  @override
  Future<PaymentDetails> getPaymentDetails({required String url}) async {
    final response = await dio.post(appNetwork.getPaymentsDetails);

    return PaymentDetailsModel.fromJson(response.data);
  }

  @override
  Future<List<SimpleCard>> getRegisterCardsUsecase() async {
    final response = await dio.get(appNetwork.getCards);

    final cards = (response.data['data'] as List).map((json) {
      return SimpleCardModel.fromJson(json);
    }).toList();

    return cards;
  }

  @override
  Future<SimpleCard> registerCard({required Card card}) async {
    final response = await dio.post(
      appNetwork.registerCard,
      data: {
        'card_name': card.cardName,
        'card_number': card.cardNumber,
        'card_cvv': card.cvv,
        'card_validate_date': card.validateDate,
        'card_cpf': card.cardCpf,
      },
    );

    return SimpleCardModel.fromJson(response.data);
  }

  @override
  Future<SimpleCard?> getLastUsedCard() async {
    final response = await dio.get(appNetwork.getLastUsedCard);

    if (response.data == null) return null;

    return SimpleCardModel.fromJson(response.data);
  }

  @override
  Future<bool> getUserHasFraud() async {
    final response = await dio.get(appNetwork.getUserHasFraud);

    return response.data['hasFraud'];
  }
}
