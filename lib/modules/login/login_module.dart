import 'package:flutter_modular/flutter_modular.dart';
import 'package:plutus_pay/modules/login/presentation/login_page.dart';
import 'package:plutus_pay/modules/shared/app_module.dart';

class LoginModule extends Module {
  static const String moduleName = '/login';
  static const routePath = AppModule.routePath + moduleName;
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          LoginModule.routePath,
          to: LoginPage.routePath,
        ),
        ChildRoute(
          LoginPage.routeName,
          child: (_, __) => const LoginPage(),
        ),
      ];
}
