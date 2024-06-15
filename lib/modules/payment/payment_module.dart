import 'package:flutter_modular/flutter_modular.dart';
import 'package:plutus_pay/modules/payment/presentation/payment_page.dart';
import 'package:plutus_pay/modules/shared/app_module.dart';

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
