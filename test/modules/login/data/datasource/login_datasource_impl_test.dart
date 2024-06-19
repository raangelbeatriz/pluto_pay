import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plutus_pay/mock/maps/sign_in_map.dart';
import 'package:plutus_pay/modules/login/data/datasource/login_datasource.dart';
import 'package:plutus_pay/modules/login/data/datasource/login_datasource_impl.dart';
import 'package:plutus_pay/modules/login/domain/entities/user.dart';
import 'package:plutus_pay/modules/shared/data/dio/dio_client.dart';

import '../../../mocks.dart';

void main() {
  late DioClient dioClientMock;

  late LoginDatasource loginDatasource;

  setUp(() {
    dioClientMock = DioClientMock();
    loginDatasource = LoginDatasourceImpl(
      dio: dioClientMock,
      network: appNetworkImplMock,
    );
  });
  group('When SignIn is called', () {
    dioCallbackMock() => dioClientMock.post(
          any(),
          data: any(named: 'data'),
        );

    test('should return a [User]', () async {
      when(dioCallbackMock).thenAnswer((_) async => ResponseMock(data: signInMap));

      final result = await loginDatasource.signIn(params: loginUsecaseParamsMock);

      expect(result, isA<User>());
      verify(dioCallbackMock).called(1);
    });
  });
}
