import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/cubit/login/login_cubit.dart';
import 'package:ecommerce/presentation/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../repository/auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Icons.home,
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
