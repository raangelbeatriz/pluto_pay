part of 'payment_cubit.dart';

class PaymentState extends Equatable {
  const PaymentState({
    this.getPaymentsDetailsStatus = Status.initial,
    this.getCardsStatus = Status.initial,
    this.paymentDetails,
    this.failure,
    this.registeredCards = const [],
  });

  final Status getPaymentsDetailsStatus;
  final Status getCardsStatus;
  final PaymentDetails? paymentDetails;
  final Failure? failure;
  final List<SimpleCard> registeredCards;

  bool get isScreenLoading => getCardsStatus.isLoading || getPaymentsDetailsStatus.isLoading;

  @override
  List<Object?> get props => [
        getPaymentsDetailsStatus,
        getCardsStatus,
        paymentDetails,
        failure,
        registeredCards,
      ];

  PaymentState copyWith({
    Status? getPaymentDetailsStatus,
    Status? getCardsStatus,
    PaymentDetails? paymentDetails,
    Failure? failure,
    List<SimpleCard>? registeredCards,
  }) {
    return PaymentState(
      getPaymentsDetailsStatus: getPaymentDetailsStatus ?? getPaymentsDetailsStatus,
      paymentDetails: paymentDetails ?? this.paymentDetails,
      failure: failure ?? this.failure,
      getCardsStatus: getCardsStatus ?? this.getCardsStatus,
      registeredCards: registeredCards ?? this.registeredCards,
    );
  }
}
