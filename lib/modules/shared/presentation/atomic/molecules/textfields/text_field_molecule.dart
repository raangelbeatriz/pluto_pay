import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class TextFieldMolecule extends StatelessWidget {
  const TextFieldMolecule({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
  });
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTextStyles.montserratMedium14.copyWith(color: AppColors.darkGrey),
          ),
          const Gap(6),
        ],
        TextField(
          cursorColor: AppColors.darkGrey,
          style: const TextStyle(color: AppColors.darkGrey),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.grey,
              ),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
