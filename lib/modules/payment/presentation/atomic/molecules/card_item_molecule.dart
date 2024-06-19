import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_text_styles.dart';
import '../../../domain/entities/simple_card.dart';

class CardItemMolecule extends StatelessWidget {
  const CardItemMolecule({
    super.key,
    required this.card,
    required this.isSelectedCard,
  });

  final SimpleCard card;
  final bool isSelectedCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelectedCard ? AppColors.purple : AppColors.darkGrey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 8,
          ),
          child: Row(
            children: [
              Text(
                card.cardBrand,
                style: AppTextStyles.montserratRegular14,
              ),
              const Gap(10),
              Text(
                card.cardNumber,
                style: AppTextStyles.montserratBold14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
