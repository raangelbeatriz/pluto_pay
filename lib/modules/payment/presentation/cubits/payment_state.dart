part of 'payment_cubit.dart';

class PaymentState extends Equatable {
  const PaymentState({
    this.getPaymentsDetailsStatus = Status.initial,
    this.getLastUsedCardStatus = Status.initial,
    this.getDeviceIdStatus = Status.initial,
    this.getUserHasFraudStatus = Status.initial,
    this.paymentDetails,
    this.failure,
    this.registeredCards = const [],
    this.selectedCard,
    required this.user,
    this.deviceId,
    this.hasFraud,
    this.message,
  });

  final Status getPaymentsDetailsStatus;
  final Status getLastUsedCardStatus;
  final PaymentDetails? paymentDetails;
  final Failure? failure;
  final List<SimpleCard> registeredCards;
  final SimpleCard? selectedCard;
  final User user;
  final Status getDeviceIdStatus;
  final String? deviceId;
  final Status getUserHasFraudStatus;
  final bool? hasFraud;
  final CustomMessage? message;

  bool get isScreenLoading => getLastUsedCardStatus.isLoading || getPaymentsDetailsStatus.isLoading;

  bool get screenHasCriticalFailure =>
      getPaymentsDetailsStatus.isFailure || getLastUsedCardStatus.isFailure;

  @override
  List<Object?> get props => [
        getPaymentsDetailsStatus,
        getLastUsedCardStatus,
        paymentDetails,
        failure,
        registeredCards,
        selectedCard,
        user,
        getDeviceIdStatus,
        deviceId,
        getUserHasFraudStatus,
        hasFraud,
        message,
      ];

  PaymentState copyWith({
    Status? getPaymentDetailsStatus,
    Status? getLastUsedCard,
    PaymentDetails? paymentDetails,
    Failure? failure,
    List<SimpleCard>? registeredCards,
    SimpleCard? selectedCard,
    Status? getDeviceIdStatus,
    String? deviceId,
    User? user,
    Status? getUserHasFraudStatus,
    Status? detectFraudLocallyStatus,
    bool? hasFraud,
    CustomMessage? message,
  }) {
    return PaymentState(
      getPaymentsDetailsStatus: getPaymentDetailsStatus ?? getPaymentsDetailsStatus,
      paymentDetails: paymentDetails ?? this.paymentDetails,
      failure: failure ?? this.failure,
      getLastUsedCardStatus: getLastUsedCard ?? getLastUsedCardStatus,
      registeredCards: registeredCards ?? this.registeredCards,
      selectedCard: selectedCard ?? this.selectedCard,
      user: user ?? this.user,
      getDeviceIdStatus: getDeviceIdStatus ?? this.getDeviceIdStatus,
      deviceId: deviceId ?? this.deviceId,
      getUserHasFraudStatus: getUserHasFraudStatus ?? this.getUserHasFraudStatus,
      hasFraud: hasFraud ?? this.hasFraud,
      message: message ?? this.message,
    );
  }
}
