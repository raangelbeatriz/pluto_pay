import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plutus_pay/modules/login/data/datasource/login_datasource_impl.dart';
import 'package:plutus_pay/modules/login/data/repositories/login_repository_impl.dart';
import 'package:plutus_pay/modules/login/domain/usecases/login_usecase_impl.dart';
import 'package:plutus_pay/modules/login/presentation/cubits/login_cubit.dart';
import 'package:plutus_pay/modules/login/presentation/pages/login_page.dart';
import 'package:plutus_pay/modules/shared/app_module.dart';

class LoginModule extends Module {
  static const String moduleName = '/login';
  static const routePath = AppModule.routePath + moduleName;
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind(
          (i) => LoginDatasourceImpl(
            dio: i(),
            network: i(),
          ),
        ),
        Bind(
          (i) => LoginRepositoryImpl(
            datasource: i(),
          ),
        ),
        Bind(
          (i) => LoginUsecaseImpl(
            loginRepository: i(),
          ),
        ),
        Bind.factory(
          (i) => LoginCubit(
            sharedNavigator: i(),
            loginUsecase: i(),
          ),
        ),
      ];

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
