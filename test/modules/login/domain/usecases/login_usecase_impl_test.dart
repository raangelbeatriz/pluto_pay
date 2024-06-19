import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plutus_pay/modules/login/domain/repositories/login_repository.dart';
import 'package:plutus_pay/modules/login/domain/usecases/login_usecase.dart';
import 'package:plutus_pay/modules/login/domain/usecases/login_usecase_impl.dart';

import '../../../mocks.dart';

void main() {
  late LoginUsecase loginUsecase;
  late LoginRepository loginRepositoryMock;

  setUp(() {
    loginRepositoryMock = LoginRepositoryImplMock();
    loginUsecase = LoginUsecaseImpl(loginRepository: loginRepositoryMock);
  });

  group('when [signIn] is called', () {
    datasourceCallbackMock() => loginRepositoryMock.signIn(params: loginUsecaseParamsMock);

    test('should return [Right] with a [User]', () async {
      when(datasourceCallbackMock).thenAnswer((_) async => const Right(userMock));
      final result = await loginUsecase.signIn(params: loginUsecaseParamsMock);

      expect(result, const Right(userMock));
    });

    test('should return [Left] with a [Failure]', () async {
      when(datasourceCallbackMock).thenAnswer((_) async => Left(failureMock));
      final result = await loginUsecase.signIn(params: loginUsecaseParamsMock);

      expect(result, Left(failureMock));
    });
  });
}
