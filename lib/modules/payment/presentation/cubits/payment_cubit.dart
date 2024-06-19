import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../login/domain/entities/user.dart';
import '../../../shared/data/errors/failure.dart';
import '../../../shared/domain/usecases/get_device_id_usecase.dart';
import '../../../shared/presentation/entities/custom_message.dart';
import '../../../shared/presentation/entities/message_types.dart';
import '../../../shared/utils/status.dart';
import '../../domain/entities/payment_details.dart';
import '../../domain/entities/simple_card.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/usecases/detect_fraud_locally_usecase.dart';
import '../../domain/usecases/get_cards_usecase.dart';
import '../../domain/usecases/get_last_used_card_usecase.dart';
import '../../domain/usecases/get_payment_details.dart';
import '../../domain/usecases/get_user_has_fraud_usecase.dart';
import '../../payment_navigator.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({
    required this.getPaymentDetailsUsecase,
    required this.getCardsUsecase,
    required this.paymentNavigator,
    required this.getLastUsedCardUsecase,
    required User user,
    required this.getDeviceIdUsecase,
    required this.getUserHasFraudUsecase,
    required this.detectFraudLocallyUseCase,
  }) : super(
          PaymentState(
            user: user,
          ),
        );

  final GetPaymentDetailsUsecase getPaymentDetailsUsecase;
  final GetCardsUsecase getCardsUsecase;
  final PaymentNavigator paymentNavigator;
  final GetLastUsedCardUsecase getLastUsedCardUsecase;
  final GetDeviceIdUsecase getDeviceIdUsecase;
  final GetUserHasFraudUsecase getUserHasFraudUsecase;
  final DetectFraudLocallyUseCase detectFraudLocallyUseCase;

  void onInit() {
    getPaymentDetails();
    getLastUsedCard();
    getDeviceId();
  }

  Future<void> getPaymentDetails() async {
    emit(state.copyWith(getPaymentDetailsStatus: Status.loading));

    final result = await getPaymentDetailsUsecase.getPaymentDetails(url: '');

    result.fold(
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

  Future<void> getLastUsedCard() async {
    emit(state.copyWith(getLastUsedCard: Status.loading));

    final result = await getLastUsedCardUsecase.getLastUsedCard();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getLastUsedCard: Status.failure,
            failure: failure,
          ),
        );
      },
      (card) {
        emit(
          state.copyWith(
            getLastUsedCard: Status.success,
            selectedCard: card,
          ),
        );
      },
    );
  }

  Future<void> onChangeCardTap() async {
    final result = await paymentNavigator.openSelectCardPage(state.selectedCard!);
    emit(state.copyWith(selectedCard: result));
  }

  Future<void> getDeviceId() async {
    emit(state.copyWith(getDeviceIdStatus: Status.loading));

    final result = await getDeviceIdUsecase.getDeviceId();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getDeviceIdStatus: Status.failure,
            failure: failure,
          ),
        );
      },
      (deviceId) {
        emit(
          state.copyWith(
            getDeviceIdStatus: Status.success,
            deviceId: deviceId,
          ),
        );
      },
    );
  }

  Future<void> getUserHasFraud() async {
    emit(state.copyWith(getUserHasFraudStatus: Status.loading));

    await Future.delayed(const Duration(seconds: 3));

    final result = await getUserHasFraudUsecase.getUserHasFraudUsecase();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getUserHasFraudStatus: Status.failure,
            failure: failure,
          ),
        );
      },
      (hasFraud) {
        emit(
          state.copyWith(
            hasFraud: hasFraud,
            getUserHasFraudStatus: Status.success,
          ),
        );

        detectRiskyOperation();
      },
    );
  }

  void onPayTap() {
    getUserHasFraud();
  }

  Future<void> detectRiskyOperation() async {
    final transaction = Transaction(
      cardNumber: state.selectedCard?.cardNumber ?? '',
      transactionDate: DateTime.now(),
      amount: state.paymentDetails?.amount ?? 0,
      deviceId: state.deviceId,
    );

    final result = detectFraudLocallyUseCase.hasPossibleFraud(
      params: DetectFraudLocallyUseCaseParams(
          transaction: transaction, hasFraud: state.hasFraud ?? true),
    );

    if (result) {
      emit(
        state.copyWith(
          message: CustomMessage(
            messageType: MessageType.error,
            message: 'Sua transação não pode ser concluída no momento',
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          message: CustomMessage(
            messageType: MessageType.success,
            message: 'Sua transação foi aprovada',
          ),
        ),
      );
    }
  }
}
