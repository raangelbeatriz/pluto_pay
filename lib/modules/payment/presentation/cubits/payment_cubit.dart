import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/data/errors/failure.dart';
import '../../../shared/utils/status.dart';
import '../../domain/entities/payment_details.dart';
import '../../domain/entities/simple_card.dart';
import '../../domain/usecases/get_cards_usecase.dart';
import '../../domain/usecases/get_payment_details.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({
    required this.getPaymentDetailsUsecase,
    required this.getCardsUsecase,
  }) : super(const PaymentState());

  final GetPaymentDetailsUsecase getPaymentDetailsUsecase;
  final GetCardsUsecase getCardsUsecase;

  void onInit() {
    getPaymentDetails();
    getCards();
  }

  Future<void> getPaymentDetails() async {
    emit(
      state.copyWith(getPaymentDetailsStatus: Status.loading),
    );

    await Future.delayed(const Duration(seconds: 5));

    final response = await getPaymentDetailsUsecase.getPaymentDetails(url: '');

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            getPaymentDetailsStatus: Status.failure,
            failure: failure,
          ),
        );
      },
      (paymentDetails) {
        emit(
          state.copyWith(
            paymentDetails: paymentDetails,
            getPaymentDetailsStatus: Status.success,
          ),
        );
      },
    );
  }

  Future<void> getCards() async {
    emit(state.copyWith(getCardsStatus: Status.loading));

    final response = await getCardsUsecase.getRegisterCardsUsecase();

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            getCardsStatus: Status.failure,
            failure: failure,
          ),
        );
      },
      (cards) {
        emit(
          state.copyWith(
            getCardsStatus: Status.success,
            registeredCards: cards,
          ),
        );
      },
    );
  }

  Future<void> onTapPay() async {}
}
