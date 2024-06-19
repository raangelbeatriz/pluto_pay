import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/data/errors/failure.dart';
import '../../../shared/utils/status.dart';
import '../../domain/entities/card.dart';
import '../../domain/usecases/register_card_usecase.dart';

part 'register_card_state.dart';

class RegisterCardCubit extends Cubit<RegisterCardState> {
  RegisterCardCubit({
    required this.registerCardUsecase,
  }) : super(const RegisterCardState());

  final RegisterCardUsecase registerCardUsecase;

  void onSaveButtonTap() {
    registerCard();
  }

  Future<void> registerCard() async {
    if (state.newCard == null) return;

    emit(state.copyWith(status: Status.loading));
    final response = await registerCardUsecase.registerCard(card: state.newCard!);

    response.fold((failure) {
      emit(
        state.copyWith(
          failure: failure,
          status: Status.failure,
        ),
      );
    }, (card) {
      emit(
        state.copyWith(
          status: Status.success,
        ),
      );
      Modular.to.pop(card);
    });
  }

  void onCardDataChanged({
    String? cardNumber,
    String? validateDate,
    String? cvv,
    String? cardName,
    String? cardCpf,
  }) {
    final card = state.newCard;
    if (card == null) {
      final newCard = Card(
        cardNumber: cardNumber,
        validateDate: validateDate,
        cvv: cvv,
        cardName: cardName,
        cardCpf: cardCpf,
      );
      emit(
        state.copyWith(
          newCard: newCard,
        ),
      );
      return;
    }
    final newCard = card.copyWith(
      cardNumber: cardNumber,
      validateDate: validateDate,
      cvv: cvv,
      cardName: cardName,
      cardCpf: cardCpf,
    );
    emit(
      state.copyWith(
        newCard: newCard,
      ),
    );
  }
}
