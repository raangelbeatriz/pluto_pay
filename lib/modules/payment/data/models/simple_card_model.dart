import '../../domain/entities/simple_card.dart';

class SimpleCardModel extends SimpleCard {
  SimpleCardModel({
    required super.id,
    required super.ownerName,
    required super.cardNumber,
    required super.cardBrand,
  });

  factory SimpleCardModel.fromJson(Map<String, dynamic> json) {
    return SimpleCardModel(
      id: json['id'],
      ownerName: json['owner_name'],
      cardNumber: json['card_number'],
      cardBrand: json['card_brand'],
    );
  }
}
