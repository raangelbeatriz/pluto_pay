import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_module.dart';
import 'data/datasources/payment_datasource_impl.dart';
import 'data/repositories/payment_repository_impl.dart';
import 'domain/usecases/detect_fraud_locally_usecase_impl.dart';
import 'domain/usecases/get_cards_usecase_impl.dart';
import 'domain/usecases/get_last_used_card_usecase_impl.dart';
import 'domain/usecases/get_payment_details_impl.dart';
import 'domain/usecases/get_user_has_fraud_usecase_impl.dart';
import 'domain/usecases/register_card_usecase_impl.dart';
import 'payment_navigator.dart';
import 'presentation/cubits/payment_cubit.dart';
import 'presentation/cubits/register_card_cubit.dart';
import 'presentation/cubits/select_card_cubit.dart';
import 'presentation/pages/payment_page.dart';
import 'presentation/pages/register_card_page.dart';
import 'presentation/pages/select_card_page.dart';

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
          (i) => const PaymentNavigator(),
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
        Bind(
          (i) => GetLastUsedCarUsecaseImpl(
            repository: i(),
          ),
        ),
        Bind(
          (i) => RegisterCardUsecaseImpl(
            repository: i(),
          ),
        ),
        Bind(
          (i) => GetUserHasFraudUsecaseImpl(
            repository: i(),
          ),
        ),
        Bind(
          (i) => DetectFraudLocallyUsecaseImpl(),
        ),
        Bind(
          (i) => PaymentCubit(
            getPaymentDetailsUsecase: i(),
            getCardsUsecase: i(),
            paymentNavigator: i(),
            getLastUsedCardUsecase: i(),
            user: i.args.data,
            getDeviceIdUsecase: i(),
            getUserHasFraudUsecase: i(),
            detectFraudLocallyUseCase: i(),
          ),
        ),
        Bind(
          (i) => SelectCardCubit(
            getCardsUsecase: i(),
            paymentNavigator: i(),
            selectedCard: i.args.data,
          ),
        ),
        Bind.factory(
          (i) => RegisterCardCubit(
            registerCardUsecase: i(),
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
        ChildRoute(
          SelectCardPage.routeName,
          child: (_, __) => const SelectCardPage(),
        ),
        ChildRoute(
          RegisterCardPage.routeName,
          child: (_, __) => const RegisterCardPage(),
        ),
      ];
}
