import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'constants/app_colors.dart';
import 'constants/app_text_styles.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.purple,
          background: AppColors.greyBackground,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: AppTextStyles.montserratBold16,
          centerTitle: true,
        ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
