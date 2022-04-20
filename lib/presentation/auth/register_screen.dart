import 'dart:developer';

import 'package:ecommerce/cubit/register/register_cubit.dart';
import 'package:ecommerce/presentation/auth/widgets/customButton.dart';
import 'package:ecommerce/presentation/auth/widgets/customTextField.dart';
import 'package:ecommerce/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../cubit/login/login_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: BlocListener<RegisterCubit, RegisterState>(
        bloc: context.read<RegisterCubit>(),
        listener: (context, state) {
          // TODO: implement listener

          if (state is RegisterError) {
            log("register Error encountered");

            Fluttertoast.showToast(
              msg: state.message,
            );
          } else if (state is RegisterLoaded) {
            Navigator.pushReplacementNamed(context, Routers.LOGIN_PAGE);
          }
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * .1),
                    child: Text(
                      'Demo Ecommerce',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        wordSpacing: 4,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        Icons.email_outlined,
                        'Email...',
                        false,
                        true,
                        emailController,
                      ),
                      CustomTextField(
                        Icons.lock_outline,
                        'Password...',
                        true,
                        false,
                        passwordController,
                      ),
                      Container()
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                        'Sign Up',
                        2,
                        () {
                          context.read<RegisterCubit>().register(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                        },
                      ),
                      SizedBox(height: size.height * .05),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
