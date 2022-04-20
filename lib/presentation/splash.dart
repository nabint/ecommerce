import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/cubit/login/login_cubit.dart';
import 'package:ecommerce/presentation/auth/login_screen.dart';
import 'package:ecommerce/presentation/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../repository/auth.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Icons.home,
      nextScreen: user != null ? HomePage() : LoginScreen(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
