part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = Status.initial,
    this.email,
    this.password,
  });

  final String? email;
  final String? password;

  @override
  List<Object?> get props => [
        status,
        email,
        password,
      ];

  final Status status;

  bool get isButtonEnable => Validators.isNotEmpty(email) && Validators.isNotEmpty(password);

  LoginState copyWith({
    Status? status,
    String? email,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
