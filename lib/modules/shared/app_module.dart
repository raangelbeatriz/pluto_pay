import 'package:flutter_modular/flutter_modular.dart';
import 'package:plutus_pay/modules/login/login_module.dart';
import 'package:plutus_pay/modules/payment/payment_module.dart';
import 'package:plutus_pay/modules/shared/configs/enviroment.dart';
import 'package:plutus_pay/modules/shared/data/app_network_impl.dart';
import 'package:plutus_pay/modules/shared/data/mock/mock_interceptor.dart';
import 'package:plutus_pay/modules/shared/shared_navigator.dart';

import '../../mock/plutus_mock_server.dart';
import 'data/app_network.dart';
import 'data/dio/dio_client_impl.dart';
import 'data/mock/mock_server.dart';

class AppModule extends Module {
  AppModule(this.environment);

  static const routePath = '';

  final Environment environment;

  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => environment,
        ),
        Bind(
          (i) => AppNetworkImpl(
            environment: i(),
          ),
        ),
        Bind(
          (i) => <MockServer<AppNetwork>>[
            PlutusMockServer(appNetwork: i()),
          ],
        ),
        Bind(
          (i) => MockInterceptor(
            mockServer: i(),
          ),
        ),
        Bind(
          (i) => DioClientImpl(
            environment: i(),
            appNetwork: i(),
            mockInterceptor: i(),
          ),
        ),
        Bind(
          (i) => const SharedNavigator(),
        ),
      ];

  @override
  final List<ModularRoute> routes = [
    RedirectRoute(
      Modular.initialRoute,
      to: LoginModule.routePath,
    ),
    ModuleRoute(
      LoginModule.moduleName,
      module: LoginModule(),
    ),
    ModuleRoute(
      PaymentModule.moduleName,
      module: PaymentModule(),
    ),
  ];
}
