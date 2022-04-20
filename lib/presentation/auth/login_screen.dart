import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff192028),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Column(
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
                        component1(
                          Icons.email_outlined,
                          'Email...',
                          false,
                          true,
                          context,
                        ),
                        component1(
                          Icons.lock_outline,
                          'Password...',
                          true,
                          false,
                          context,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            component2('LOGIN', 2.58, () {
                              HapticFeedback.lightImpact();
                              Fluttertoast.showToast(
                                  msg: 'Login button pressed');
                            }, context),
                            SizedBox(width: size.width / 20),
                            component2('Forgotten password!', 2.58, () {
                              HapticFeedback.lightImpact();
                              Fluttertoast.showToast(
                                  msg: 'Forgotten password button pressed');
                            }, context),
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
                        component2('Create a new Account', 2, () {
                          HapticFeedback.lightImpact();
                          Fluttertoast.showToast(
                              msg: 'Create a new account button pressed');
                        }, context),
                        SizedBox(height: size.height * .05),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget component1(IconData icon, String hintText, bool isPassword,
      bool isEmail, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 8,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            style: TextStyle(color: Colors.white.withOpacity(.8)),
            cursorColor: Colors.white,
            obscureText: isPassword,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle:
                  TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
            ),
          ),
        ),
      ),
    );
  }

  Widget component2(
    String string,
    double width,
    VoidCallback voidCallback,
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            height: size.width / 8,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style: TextStyle(color: Colors.white.withOpacity(.8)),
            ),
          ),
        ),
      ),
    );
  }
}
