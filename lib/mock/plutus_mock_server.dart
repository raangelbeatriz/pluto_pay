import 'package:plutus_pay/modules/shared/data/mock/mock_server.dart';
import 'package:plutus_pay/modules/shared/data/app_network_impl.dart';

import '../modules/shared/data/mock/mock_response.dart';
import 'login/sign_in_request.dart';

class PlutusMockServer extends MockServer<AppNetworkImpl> {
  PlutusMockServer({
    required super.appNetwork,
  });

  @override
  Map<String, MockRequest> get requests => {
        appNetwork.signIn: SignInRequest(),
      };
}
