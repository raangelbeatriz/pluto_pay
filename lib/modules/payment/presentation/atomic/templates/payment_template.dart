import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_text_styles.dart';
import '../../../../shared/presentation/atomic/molecules/filled_button_molecule.dart';

class PaymentTemplate extends StatelessWidget {
  const PaymentTemplate({
    super.key,
    required this.onPayTap,
    required this.storeName,
    required this.amount,
    required this.onChangeCardTap,
  });

  final VoidCallback onPayTap;
  final VoidCallback onChangeCardTap;
  final String storeName;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      appBar: AppBar(
        title: Text(
          'Payment',
          style: AppTextStyles.montserratBold16,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: AppColors.white,
              elevation: 1,
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Pagar para ',
                          style: AppTextStyles.montserratMedium14,
                          children: [
                            TextSpan(
                              text: 'Matilda',
                              style: AppTextStyles.montserratBold16,
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      Text(
                        'R\$ 10,00',
                        style: AppTextStyles.montserratRegular16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(16),
            Text(
              'Cartão',
              style: AppTextStyles.montserratBold16,
            ),
            const Gap(16),
            Material(
              color: AppColors.white,
              elevation: 1,
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '***3467',
                        style: AppTextStyles.montserratRegular14,
                      ),
                      TextButton(
                        onPressed: onChangeCardTap,
                        child: const Text('Trocar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(24),
            SizedBox(
              width: double.infinity,
              child: FilledButtonMolecule(
                onTap: onPayTap,
                text: 'Pagar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
