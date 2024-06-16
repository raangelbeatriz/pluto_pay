import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/shared_navigator.dart';
import '../../../shared/utils/status.dart';
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

    final result = await loginUsecase.signIn(email: '', password: '');

    result.fold((failure) {
      emit(
        state.copyWith(status: Status.failure),
      );
    }, (user) {
      state.copyWith(status: Status.success);

      sharedNavigator.openPaymentModule();
    });
  }
}
