import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../shared/constants/app_assets.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_text_styles.dart';
import '../../../../shared/presentation/atomic/molecules/filled_button_molecule.dart';
import '../../../../shared/presentation/atomic/molecules/textfields/text_field_molecule.dart';

class LoginTemplate extends StatelessWidget {
  const LoginTemplate({super.key, required this.onContinueTap});

  final VoidCallback onContinueTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.logo,
              height: 30,
              width: 30,
            ),
            const Gap(15),
            Text(
              'Plutus Pay',
              style: AppTextStyles.montserratBold16.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
            const TextFieldMolecule(
              label: 'Login',
            ),
            const Gap(12),
            const TextFieldMolecule(
              label: 'Senha',
              prefixIcon: Icon(
                Icons.lock_clock_outlined,
              ),
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              child: FilledButtonMolecule(
                onTap: onContinueTap,
                text: 'Comprar',
                isEnabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
