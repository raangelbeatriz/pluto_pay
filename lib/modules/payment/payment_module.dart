import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_module.dart';
import 'data/datasources/payment_datasource_impl.dart';
import 'data/repositories/payment_repository_impl.dart';
import 'domain/usecases/get_cards_usecase_impl.dart';
import 'domain/usecases/get_payment_details_impl.dart';
import 'presentation/cubits/payment_cubit.dart';
import 'presentation/pages/payment_page.dart';

class PaymentModule extends Module {
  static const String moduleName = '/payment';
  static const routePath = AppModule.routePath + moduleName;
  @override
  List<Bind> get binds => [
        Bind(
          (i) => PaymentDatasourceImpl(
            dio: i(),
            appNetwork: i(),
          ),
        ),
        Bind(
          (i) => PaymentRepositoryImpl(
            datasource: i(),
          ),
        ),
        Bind(
          (i) => GetPaymentDetailsUsecaseImpl(
            repository: i(),
          ),
        ),
        Bind(
          (i) => GetCardsUsecaseImpl(
            repository: i(),
          ),
        ),
        Bind.factory(
          (i) => PaymentCubit(
            getPaymentDetailsUsecase: i(),
            getCardsUsecase: i(),
          ),
        ),
      ];

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
