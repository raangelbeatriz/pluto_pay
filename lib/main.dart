import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plutus_pay/modules/shared/app_module.dart';
import 'package:plutus_pay/modules/shared/app_widget.dart';
import 'package:plutus_pay/modules/shared/configs/app_enviroments.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(
        MockEnvironment(),
      ),
      child: const AppWidget(),
    ),
  );
}
