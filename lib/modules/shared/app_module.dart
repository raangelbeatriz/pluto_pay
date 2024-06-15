import 'package:flutter_modular/flutter_modular.dart';
import 'package:plutus_pay/modules/login/login_module.dart';

class AppModule extends Module {
  AppModule();
  static const routePath = '';

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
  ];
}
