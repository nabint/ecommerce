import 'package:ecommerce/cubit/login/login_cubit.dart';
import 'package:ecommerce/presentation/auth/login_screen.dart';
import 'package:ecommerce/presentation/auth/register_screen.dart';
import 'package:ecommerce/presentation/home/home.dart';
import 'package:ecommerce/presentation/splash.dart';
import 'package:ecommerce/repository/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routers {
  static const HOME_PAGE = "home_page";
  static const SPLASH = "splash_screen";
  static const LOGIN_PAGE = "login_page";
  static const REGISTER_PAGE = "register_page";
  static onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case LOGIN_PAGE:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case HOME_PAGE:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case REGISTER_PAGE:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );
    }
  }
}
