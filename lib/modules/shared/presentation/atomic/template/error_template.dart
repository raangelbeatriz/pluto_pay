import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../constants/app_text_styles.dart';
import '../molecules/filled_button_molecule.dart';

class ErrorTemplate extends StatelessWidget {
  const ErrorTemplate({super.key, this.retryButton});

  final VoidCallback? retryButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Algo deu errado.\n Por favor tente novamente mais tarde',
                textAlign: TextAlign.center,
                style: AppTextStyles.montserratMedium16,
              ),
              const Gap(24),
              if (retryButton != null) FilledButtonMolecule(onTap: () {}, text: 'Tentar Novamente'),
            ],
          ),
        ),
      ),
    );
  }
}
