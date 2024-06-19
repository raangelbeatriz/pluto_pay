import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plutus_pay/mock/maps/get_cards_map.dart';
import 'package:plutus_pay/mock/maps/get_last_used_card.dart';
import 'package:plutus_pay/mock/maps/get_payments_details_map.dart';
import 'package:plutus_pay/mock/maps/get_user_has_fraud_map.dart';
import 'package:plutus_pay/mock/maps/register_card_map.dart';
import 'package:plutus_pay/modules/payment/data/datasources/payment_datasource.dart';
import 'package:plutus_pay/modules/payment/data/datasources/payment_datasource_impl.dart';
import 'package:plutus_pay/modules/payment/domain/entities/payment_details.dart';
import 'package:plutus_pay/modules/payment/domain/entities/simple_card.dart';
import 'package:plutus_pay/modules/shared/data/dio/dio_client.dart';

import '../../../mocks.dart';

void main() {
  late DioClient dioClientMock;
  late PaymentDatasource paymentDatasource;

  setUp(() {
    dioClientMock = DioClientMock();

    paymentDatasource = PaymentDatasourceImpl(
      dio: dioClientMock,
      appNetwork: appNetworkImplMock,
    );
  });

  group('When [getLastUsedCard] is called', () {
    dioCallbackMock() => dioClientMock.get(any());

    test('should return a [SimpleCard]', () async {
      when(dioCallbackMock).thenAnswer((_) async => ResponseMock(data: getLastUsedCardMap));

      final result = await paymentDatasource.getLastUsedCard();

      expect(result, isA<SimpleCard>());
      verify(dioCallbackMock).called(1);
    });

    test('should return a [null]', () async {
      when(dioCallbackMock).thenAnswer((_) async => ResponseMock(data: null));

      final result = await paymentDatasource.getLastUsedCard();

      expect(result, null);
      verify(dioCallbackMock).called(1);
    });
  });

  group('When [getPaymentDetails] is called', () {
    dioCallbackMock() => dioClientMock.post(any());

    test('should return [PaymentDetails]', () async {
      when(dioCallbackMock).thenAnswer((_) async => ResponseMock(data: getPaymentDetailsMap));

      final result = await paymentDatasource.getPaymentDetails(url: 'some_url');

      expect(result, isA<PaymentDetails>());
      verify(dioCallbackMock).called(1);
    });
  });

  group('When [getRegisterCardsUsecase] is called', () {
    dioCallbackMock() => dioClientMock.get(any());

    test('should return a list of [SimpleCard]', () async {
      when(dioCallbackMock).thenAnswer((_) async => ResponseMock(data: getCardsMap));

      final result = await paymentDatasource.getRegisterCardsUsecase();

      expect(result, isA<List<SimpleCard>>());
      expect(result.length, greaterThan(0));
      verify(dioCallbackMock).called(1);
    });
  });

  group('When [registerCard] is called', () {
    dioCallbackMock() => dioClientMock.post(any(), data: any(named: 'data'));

    test('should return a [SimpleCard]', () async {
      when(dioCallbackMock).thenAnswer((_) async => ResponseMock(data: registerCardMap));

      final result = await paymentDatasource.registerCard(card: cardMock);

      expect(result, isA<SimpleCard>());
      verify(dioCallbackMock).called(1);
    });
  });

  group('When [getUserHasFraud] is called', () {
    dioCallbackMock() => dioClientMock.get(any());

    test('should return a [false]', () async {
      when(dioCallbackMock).thenAnswer((_) async => ResponseMock(data: getUserHasFraudMap));

      final result = await paymentDatasource.getUserHasFraud();

      expect(result, isA<bool>());
      expect(result, isFalse);
      verify(dioCallbackMock).called(1);
    });

    test('should return a [true]', () async {
      when(dioCallbackMock)
          .thenAnswer((_) async => ResponseMock(data: getUserHasFraudMapIsTrueMock));

      final result = await paymentDatasource.getUserHasFraud();

      expect(result, isA<bool>());
      expect(result, isTrue);
      verify(dioCallbackMock).called(1);
    });
  });
}
