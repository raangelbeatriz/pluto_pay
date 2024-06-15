import 'package:flutter_modular/flutter_modular.dart';
import 'package:plutus_pay/modules/login/login_module.dart';
import 'package:plutus_pay/modules/payment/payment_module.dart';
import 'package:plutus_pay/modules/shared/shared_navigator.dart';

class AppModule extends Module {
  AppModule();
  static const routePath = '';

  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
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
