import 'package:advanced_project/features/login/login_screen.dart';
import 'package:advanced_project/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class AppRouter{
  Route generateRoute(RouteSettings settings){

    final arguments = settings.arguments;
    
    switch (settings.name){

      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) =>const OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) =>const LoginScreen());
      default:
        return MaterialPageRoute(builder: (context) =>const Scaffold(body: Center(child: Text('Route not found')),));
    }
  }
}