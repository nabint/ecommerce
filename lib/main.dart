import 'package:ecommerce/cubit/login/login_cubit.dart';
import 'package:ecommerce/cubit/register/register_cubit.dart';
import 'package:ecommerce/presentation/auth/login_screen.dart';
import 'package:ecommerce/presentation/splash.dart';
import 'package:ecommerce/repository/auth.dart';
import 'package:ecommerce/utils/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(AuthRepo(FirebaseAuth.instance)),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(
            AuthRepo(FirebaseAuth.instance),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (settings) => Routers.onGenerateRoute(settings),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routers.SPLASH,
    );
  }
}
