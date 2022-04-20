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
      bool res = await authRepo.signIn(email: email, password: password);
      if (res == true) {
        emit(
          LoggedIn(),
        );
      } else {
        LoginError(
          message: "error loggin in",
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
