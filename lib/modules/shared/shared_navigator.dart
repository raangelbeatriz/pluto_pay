import 'package:flutter_modular/flutter_modular.dart';

import '../login/domain/entities/user.dart';
import '../payment/presentation/pages/payment_page.dart';

class SharedNavigator {
  const SharedNavigator();

  void openPaymentModule(User user) {
    Modular.to.navigate(
      PaymentPage.routePath,
      arguments: user,
    );
  }
}
