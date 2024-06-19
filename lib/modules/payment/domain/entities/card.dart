import '../../../shared/utils/validators.dart';

class Card {
  const Card({
    required this.cardNumber,
    required this.validateDate,
    required this.cvv,
    required this.cardName,
    required this.cardCpf,
  });

  final String? cardNumber;
  final String? validateDate;
  final String? cvv;
  final String? cardName;
  final String? cardCpf;

  bool get isEnable =>
      Validators.isNotEmpty(cardNumber) &&
      Validators.isNotEmpty(validateDate) &&
      Validators.isNotEmpty(cvv) &&
      Validators.isNotEmpty(cardName) &&
      Validators.isNotEmpty(cardCpf);

  Card copyWith({
    String? cardNumber,
    String? validateDate,
    String? cvv,
    String? cardName,
    String? cardCpf,
  }) {
    return Card(
      cardNumber: cardNumber ?? this.cardNumber,
      validateDate: validateDate ?? this.validateDate,
      cvv: cvv ?? this.cvv,
      cardName: cardName ?? this.cardName,
      cardCpf: cardCpf ?? this.cardCpf,
    );
  }
}
