import '../modules/shared/data/app_network_impl.dart';
import '../modules/shared/data/mock/mock_response.dart';
import '../modules/shared/data/mock/mock_server.dart';
import 'login/sign_in_request.dart';
import 'payments/get_cards_request.dart';
import 'payments/get_last_used_card_request.dart';
import 'payments/get_payment_details_request.dart';
import 'payments/get_user_has_fraud_request.dart';
import 'payments/register_card_usecase_request.dart';

class PlutusMockServer extends MockServer<AppNetworkImpl> {
  PlutusMockServer({
    required super.appNetwork,
  });

  @override
  Map<String, MockRequest> get requests => {
        appNetwork.signIn: SignInRequest(),
        appNetwork.getPaymentsDetails: GetPaymentDetailsRequest(),
        appNetwork.getCards: GetCardsRequest(),
        appNetwork.getLastUsedCard: GetLastUsedCardRequest(),
        appNetwork.registerCard: RegisterCardUsecaseRequest(),
        appNetwork.getUserHasFraud: GetUserHasFraudRequest(),
      };
}
