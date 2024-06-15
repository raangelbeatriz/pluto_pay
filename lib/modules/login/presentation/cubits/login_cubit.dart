import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plutus_pay/modules/shared/shared_navigator.dart';
import 'package:plutus_pay/modules/shared/utils/status.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.sharedNavigator,
  }) : super(const LoginState());

  final SharedNavigator sharedNavigator;

  void onContinueTap() {
    sharedNavigator.openPaymentModule();
  }
}
