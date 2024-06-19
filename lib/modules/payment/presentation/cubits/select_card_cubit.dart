import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/data/errors/failure.dart';
import '../../../shared/utils/status.dart';
import '../../domain/entities/simple_card.dart';
import '../../domain/usecases/get_cards_usecase.dart';
import '../../payment_navigator.dart';

part 'select_card_state.dart';

class SelectCardCubit extends Cubit<SelectCardState> {
  SelectCardCubit({
    required this.getCardsUsecase,
    required this.paymentNavigator,
    required SimpleCard selectedCard,
  }) : super(
          SelectCardState(
            selectedCard: selectedCard,
          ),
        );

  final GetCardsUsecase getCardsUsecase;
  final PaymentNavigator paymentNavigator;

  void onInit() {
    getCards();
  }

  Future<void> getCards() async {
    emit(state.copyWith(status: Status.loading));

    final response = await getCardsUsecase.getRegisterCardsUsecase();

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            status: Status.failure,
            failure: failure,
          ),
        );
      },
      (cards) {
        emit(
          state.copyWith(
            status: Status.success,
            cards: cards,
          ),
        );
      },
    );
  }

  void selectNewCard(SimpleCard newSelectedCard) {
    emit(state.copyWith(selectedCard: newSelectedCard));
    Modular.to.pop(state.selectedCard);
  }

  Future<void> onRegisterNewCardTap() async {
    final card = await paymentNavigator.openRegisterCardPage();
    if (card != null) onInit();
  }
}
