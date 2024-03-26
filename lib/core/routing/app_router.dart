import 'package:advanced_project/core/di/dependency_injection.dart';
import 'package:advanced_project/features/home/ui/home_screen.dart';
import 'package:advanced_project/features/login/logic/cubit/login_cubit.dart';

import 'package:advanced_project/features/login/ui/login_screen.dart';
import 'package:advanced_project/features/onboarding/onboarding_screen.dart';
import 'package:advanced_project/features/signup/logic/sing_up_cubit.dart';
import 'package:advanced_project/features/signup/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));

      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignupCubit>(),
                  child: const SignupScreen(),
                ));

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(child: Text('Route not found')),
                ));
    }
  }
}
