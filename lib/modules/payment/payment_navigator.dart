import 'package:flutter_modular/flutter_modular.dart';

import 'domain/entities/simple_card.dart';
import 'presentation/pages/register_card_page.dart';
import 'presentation/pages/select_card_page.dart';

class PaymentNavigator {
  const PaymentNavigator();

  Future<dynamic> openSelectCardPage(SimpleCard selectedCard) async {
    return await Modular.to.pushNamed(
      SelectCardPage.routePath,
      arguments: selectedCard,
    );
  }

  Future<SimpleCard?> openRegisterCardPage() async {
    return await Modular.to.pushNamed(RegisterCardPage.routePath);
  }
}
