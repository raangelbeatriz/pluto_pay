import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../shared/presentation/atomic/molecules/filled_button_molecule.dart';
import '../../../../shared/presentation/atomic/molecules/textfields/text_field_molecule.dart';
import '../../../../shared/utils/text_fields_maks.dart';
import '../../entities/card_data_setter.dart';

class RegisterCardTemplate extends StatelessWidget {
  const RegisterCardTemplate({
    super.key,
    required this.onCardDataChanged,
    required this.isButtonEnabled,
    required this.onSaveCardTap,
    required this.isButtonLoading,
  });

  final CardDataSetter onCardDataChanged;
  final bool isButtonEnabled;
  final VoidCallback onSaveCardTap;
  final bool isButtonLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Cartão'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            TextFieldMolecule(
              label: 'Número do Cartão',
              textInputType: TextInputType.number,
              mask: TextFieldsMasks.creditCardMask,
              onChanged: (value) => onCardDataChanged(cardNumber: value),
            ),
            const Gap(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFieldMolecule(
                    label: 'Validade',
                    textInputType: TextInputType.number,
                    mask: TextFieldsMasks.cardDateMask,
                    onChanged: (value) => onCardDataChanged(validateDate: value),
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: TextFieldMolecule(
                    label: 'CVV',
                    maxLenght: 3,
                    textInputType: TextInputType.number,
                    onChanged: (value) => onCardDataChanged(cvv: value),
                  ),
                ),
              ],
            ),
            const Gap(16),
            TextFieldMolecule(
              label: 'Nome do titular',
              onChanged: (value) => onCardDataChanged(cardName: value),
            ),
            const Gap(16),
            TextFieldMolecule(
              label: 'CPF do Titular',
              textInputType: TextInputType.number,
              mask: TextFieldsMasks.cpfMask,
              onChanged: (value) => onCardDataChanged(cardCpf: value),
            ),
            const Gap(16),
            FilledButtonMolecule(
              isEnabled: isButtonEnabled,
              onTap: onSaveCardTap,
              isLoading: isButtonLoading,
              text: 'Salvar',
            ),
          ],
        ),
      ),
    );
  }
}
