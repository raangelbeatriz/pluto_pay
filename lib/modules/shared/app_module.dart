import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../mock/plutus_mock_server.dart';
import '../login/login_module.dart';
import '../payment/payment_module.dart';
import 'configs/enviroment.dart';
import 'data/app_network.dart';
import 'data/app_network_impl.dart';
import 'data/datasources/shared_local_datasource_impl.dart';
import 'data/dio/dio_client_impl.dart';
import 'data/mock/mock_interceptor.dart';
import 'data/mock/mock_server.dart';
import 'data/repositories/shared_repository_impl.dart';
import 'domain/usecases/get_device_id_usecase_impl.dart';
import 'shared_navigator.dart';

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
        Bind(
          (i) => DeviceInfoPlugin(),
        ),
        Bind(
          (i) => SharedLocalDatasourceImpl(
            deviceInfoPlugin: i(),
          ),
        ),
        Bind(
          (i) => SharedRepositoryImpl(
            sharedLocalDatasource: i(),
          ),
        ),
        Bind(
          (i) => GetDeviceIdUsecaseImpl(
            sharedRepository: i(),
          ),
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
