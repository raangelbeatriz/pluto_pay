import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_module.dart';
import 'presentation/payment_page.dart';

class PaymentModule extends Module {
  static const String moduleName = '/payment';
  static const routePath = AppModule.routePath + moduleName;
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          PaymentModule.routePath,
          to: PaymentPage.routePath,
        ),
        ChildRoute(
          PaymentPage.routeName,
          child: (_, __) => const PaymentPage(),
        ),
      ];
}
