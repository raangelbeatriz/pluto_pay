import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class FilledButtonMolecule extends StatefulWidget {
  const FilledButtonMolecule({
    super.key,
    this.isEnabled = true,
    this.isLoading = false,
    required this.onTap,
    required this.text,
  });

  final bool isEnabled;
  final bool isLoading;
  final VoidCallback onTap;
  final String text;

  Function()? get _onPressed => isEnabled ? onTap : null;

  @override
  State<FilledButtonMolecule> createState() => _FilledButtonMoleculeState();
}

class _FilledButtonMoleculeState extends State<FilledButtonMolecule> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: widget.isEnabled ? AppColors.black : AppColors.inactive,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: widget._onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: widget.isLoading
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: AppColors.white,
                  ),
                )
              : FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      Text(
                        widget.text,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.montserratBold14.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
