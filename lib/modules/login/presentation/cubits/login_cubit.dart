import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/shared_navigator.dart';
import '../../../shared/utils/status.dart';
import '../../../shared/utils/validators.dart';
import '../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.sharedNavigator,
    required this.loginUsecase,
  }) : super(const LoginState());

  final SharedNavigator sharedNavigator;
  final LoginUsecase loginUsecase;

  Future<void> onContinueTap() async {
    emit(state.copyWith(status: Status.loading));

    final result = await loginUsecase.signIn(
      params: LoginUsecaseParams(
        email: state.email!,
        password: state.password!,
      ),
    );

    result.fold((failure) {
      emit(
        state.copyWith(status: Status.failure),
      );
    }, (user) {
      state.copyWith(status: Status.success);

      sharedNavigator.openPaymentModule(user);
    });
  }

  void onChangeEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void onChangePassword(String password) {
    emit(state.copyWith(password: password));
  }
}
