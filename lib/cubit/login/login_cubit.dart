import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:ecommerce/repository/auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(
    this.authRepo,
  ) : super(LoginInitial());

  login(String email, String password) async {
    emit(
      LoginLoading(),
    );
    try {
      String res =
          await authRepo.signIn(email: email.trim(), password: password);
      if (res == "Logged In") {
        emit(
          LoggedIn(),
        );
      } else {
        LoginError(
          message: res,
        );
      }
    } catch (e) {
      emit(
        LoginError(
          message: e.toString(),
        ),
      );
    }
  }

  logout() async {
    try {
      authRepo.signOut();
    } catch (e) {
      emit(
        SignOutError(),
      );
    }
  }
}
