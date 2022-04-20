part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoggedIn extends LoginState {}

class SignOutError extends LoginState {}

class SignedOut extends LoginState {}

class LoginError extends LoginState {
  final String message;
  LoginError({
    required this.message,
  });
}
