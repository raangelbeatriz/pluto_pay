import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plutus_pay/modules/login/data/datasource/login_datasource.dart';
import 'package:plutus_pay/modules/login/data/repositories/login_repository_impl.dart';
import 'package:plutus_pay/modules/login/domain/repositories/login_repository.dart';

import '../../../mocks.dart';

void main() {
  late LoginRepository respository;
  late LoginDatasource loginDatasourceMock;

  setUp(() {
    loginDatasourceMock = LoginDatasourceMock();
    respository = LoginRepositoryImpl(datasource: loginDatasourceMock);
  });

  group('when [signIn] is called', () {
    datasourceCallbackMock() => loginDatasourceMock.signIn(params: loginUsecaseParamsMock);

    test('should return [Right] with a [User]', () async {
      when(datasourceCallbackMock).thenAnswer((_) async => userMock);
      final result = await respository.signIn(params: loginUsecaseParamsMock);

      expect(result, const Right(userMock));
    });

    test('should return [Left] with a [Failure]', () async {
      when(datasourceCallbackMock).thenThrow(exceptionMock);
      final result = await respository.signIn(params: loginUsecaseParamsMock);

      expect(result, Left(failureMock));
    });
  });
}
