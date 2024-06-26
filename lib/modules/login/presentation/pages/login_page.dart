import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/presentation/atomic/molecules/messages_molecule.dart';
import '../../../shared/utils/status.dart';
import '../../login_module.dart';
import '../atomic/templates/login_template.dart';
import '../cubits/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = '/login-page';
  static const String routePath = LoginModule.moduleName + routeName;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Messages {
  final cubit = Modular.get<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          showError('Não foi possível fazer o login');
        }
      },
      bloc: cubit,
      listenWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return LoginTemplate(
          onContinueTap: cubit.onContinueTap,
          isLoading: state.status.isLoading,
          onChangedPassword: cubit.onChangePassword,
          onChangedEmail: cubit.onChangeEmail,
          isButtonEnable: state.isButtonEnable,
        );
      },
    );
  }
}
