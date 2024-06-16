import 'package:flutter_modular/flutter_modular.dart';
import '../payment/payment_module.dart';

class SharedNavigator {
  const SharedNavigator();

  void openPaymentModule() {
    Modular.to.navigate(
      PaymentModule.moduleName,
    );
  }
}
