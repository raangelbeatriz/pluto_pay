import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plutus_pay/modules/login/data/datasource/login_datasource.dart';
import 'package:plutus_pay/modules/login/domain/entities/user.dart';
import 'package:plutus_pay/modules/login/domain/repositories/login_repository.dart';
import 'package:plutus_pay/modules/login/domain/usecases/login_usecase.dart';
import 'package:plutus_pay/modules/payment/domain/entities/card.dart';
import 'package:plutus_pay/modules/payment/domain/entities/transaction.dart';
import 'package:plutus_pay/modules/shared/configs/app_enviroments.dart';
import 'package:plutus_pay/modules/shared/data/app_network_impl.dart';
import 'package:plutus_pay/modules/shared/data/dio/dio_client.dart';
import 'package:plutus_pay/modules/shared/data/errors/failure.dart';

class DioClientMock extends Mock implements DioClient {}

class LoginRepositoryImplMock extends Mock implements LoginRepository {}

class LoginDatasourceMock extends Mock implements LoginDatasource {}

final emptyRequestOptions = RequestOptions(path: '');

final loginUsecaseParamsMock = LoginUsecaseParams(email: 'beatriz@gmail.com', password: '123456');

final exceptionMock = Exception('Error');

final failureMock = Failure(exception: exceptionMock);

final appNetworkImplMock = AppNetworkImpl(environment: MockEnvironment());

const userMock =
    User(email: 'beatriz@gmail.com', name: 'Beatriz', cpf: '01234567890', id: '233223');

const getUserHasFraudMapIsTrueMock = {'hasFraud': true};

final cardMock = Card(
  cardName: 'Test Card',
  cardNumber: '1234567890123456',
  cvv: '123',
  validateDate: '12/24',
  cardCpf: '01234567890',
);

final transactionMock = Transaction(
  amount: 100,
  transactionDate: DateTime.now(),
  cardNumber: '1234567890123456',
  deviceId: '1234567',
);

final transactionWithPeakHourMock = Transaction(
  amount: 2500,
  transactionDate: DateTime(2024, 6, 19, 20),
  cardNumber: '1234567890123456',
  deviceId: '1234567',
);

final transactionWithPeakHourAndNotSuspectAmountMock = Transaction(
  amount: 100,
  transactionDate: DateTime(2024, 6, 19, 20),
  cardNumber: '1234567890123456',
  deviceId: '1234567',
);

final transactionWithoutPeakHourAndSuspectAmountMock = Transaction(
  amount: 2500,
  transactionDate: DateTime(2024, 6, 19, 10),
  cardNumber: '1234567890123456',
  deviceId: '1234567',
);

final transactionNormalTimeAndAmountMock = Transaction(
  amount: 1500,
  transactionDate: DateTime(2024, 6, 19, 10),
  cardNumber: '1234567890123456',
  deviceId: '1234567',
);

class ResponseMock<T> extends Response<T> {
  ResponseMock({
    RequestOptions? requestOptions,
    super.data,
    super.headers,
    super.isRedirect,
    super.statusCode,
    super.statusMessage,
    super.redirects,
    super.extra,
  }) : super(requestOptions: requestOptions ?? emptyRequestOptions);
}
