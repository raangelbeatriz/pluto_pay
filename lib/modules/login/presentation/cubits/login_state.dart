part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = Status.initial,
  });

  @override
  List<Object?> get props => [
        status,
      ];

  final Status status;

  LoginState copyWith({
    Status? status,
  }) {
    return LoginState(
      status: status ?? this.status,
    );
  }
}
