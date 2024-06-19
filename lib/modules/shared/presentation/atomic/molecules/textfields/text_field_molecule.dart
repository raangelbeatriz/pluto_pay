import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class TextFieldMolecule extends StatefulWidget {
  const TextFieldMolecule({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.label,
    this.textInputType = TextInputType.name,
    this.obscureText = false,
    this.maxLenght,
    this.mask,
    this.onChanged,
  });
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextInputType textInputType;
  final bool obscureText;
  final int? maxLenght;
  final String? mask;
  final ValueChanged<String>? onChanged;

  @override
  State<TextFieldMolecule> createState() => _TextFieldMoleculeState();
}

class _TextFieldMoleculeState extends State<TextFieldMolecule> {
  MaskTextInputFormatter? maskTextInputFormatter;

  @override
  void initState() {
    super.initState();
    if (widget.mask != null) {
      maskTextInputFormatter = MaskTextInputFormatter(mask: widget.mask);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          keyboardType: widget.textInputType,
          obscureText: widget.obscureText,
          cursorColor: AppColors.darkGrey,
          maxLength: widget.maxLenght,
          onChanged: widget.onChanged,
          inputFormatters: maskTextInputFormatter != null ? [maskTextInputFormatter!] : [],
          style: const TextStyle(color: AppColors.darkGrey),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.grey,
              ),
            ),
            label: Text(
              widget.label,
              style: AppTextStyles.montserratRegular14,
            ),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
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
