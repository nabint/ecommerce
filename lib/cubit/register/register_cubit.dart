import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:ecommerce/repository/auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  RegisterCubit(
    this.authRepo,
  ) : super(
          RegisterInitial(),
        );

  void register(String email, String password) async {
    emit(
      RegisterLoading(),
    );
    try {
      String res = await authRepo.signUp(email: email, password: password);
      if (res == "Signed up") {
        log(res);
        emit(
          RegisterLoaded(),
        );
      } else {
        log("Register format error " + res);
        emit(
          RegisterError(message: res),
        );
      }
    } catch (e) {
      emit(
        RegisterError(
          message: e.toString(),
        ),
      );
    }
  }
}
