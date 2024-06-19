part of 'register_card_cubit.dart';

class RegisterCardState extends Equatable {
  const RegisterCardState({
    this.newCard,
    this.status = Status.initial,
    this.failure,
  });

  final Card? newCard;
  final Status status;
  final Failure? failure;

  @override
  List<Object?> get props => [
        newCard,
        status,
        failure,
      ];

  bool get isButtonEnable => newCard?.isEnable ?? false;

  RegisterCardState copyWith({
    Card? newCard,
    Status? status,
    Failure? failure,
  }) {
    return RegisterCardState(
      newCard: newCard ?? this.newCard,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
