import 'dart:ui';
import 'package:ecommerce/cubit/login/login_cubit.dart';
import 'package:ecommerce/presentation/auth/widgets/customButton.dart';
import 'package:ecommerce/presentation/auth/widgets/customTextField.dart';
import 'package:ecommerce/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit loginbloc;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loginbloc = context.read<LoginCubit>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginError) {
          Fluttertoast.showToast(
            msg: state.message,
          );
        } else if (state is LoggedIn) {
          Navigator.pushReplacementNamed(
            context,
            Routers.HOME_PAGE,
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff192028),
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
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
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextField(Icons.email_outlined, 'Email...', false,
                          true, emailController),
                      CustomTextField(Icons.lock_outline, 'Password...', true,
                          false, passwordController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            'LOGIN',
                            2.58,
                            () {
                              loginbloc.login(emailController.text,
                                  passwordController.text);
                              Fluttertoast.showToast(
                                msg: 'Login button pressed',
                              );
                            },
                          ),
                          SizedBox(width: size.width / 20),
                          CustomButton(
                            'Forgotten password!',
                            2.58,
                            () {
                              Fluttertoast.showToast(
                                  msg: 'Forgotten password button pressed');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        'Create a new Account',
                        2,
                        () {
                          Navigator.pushNamed(
                            context,
                            Routers.REGISTER_PAGE,
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
