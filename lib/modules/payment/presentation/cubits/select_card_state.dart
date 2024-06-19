part of 'select_card_cubit.dart';

class SelectCardState extends Equatable {
  const SelectCardState({
    this.status = Status.initial,
    this.cards = const [],
    this.failure,
    required this.selectedCard,
  });

  final Status status;
  final List<SimpleCard> cards;
  final Failure? failure;
  final SimpleCard selectedCard;

  @override
  List<Object?> get props => [
        status,
        cards,
        failure,
        selectedCard,
      ];

  SelectCardState copyWith({
    Status? status,
    List<SimpleCard>? cards,
    Failure? failure,
    SimpleCard? selectedCard,
  }) {
    return SelectCardState(
      status: status ?? this.status,
      cards: cards ?? this.cards,
      failure: failure ?? this.failure,
      selectedCard: selectedCard ?? this.selectedCard,
    );
  }
}
