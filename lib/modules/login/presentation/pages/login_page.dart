import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

class _LoginPageState extends State<LoginPage> {
  final cubit = Modular.get<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      bloc: cubit,
      builder: (context, state) {
        return LoginTemplate(
          onContinueTap: cubit.onContinueTap,
        );
      },
    );
  }
}
