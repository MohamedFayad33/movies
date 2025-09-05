import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/modules/auth/login_screen.dart';
import 'package:movies_app/modules/onBoarding_view/on_boarding_screen_view.dart';


abstract class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    PagesRoutesName.onBoarding: (context) => const OnBoardingScreenView(),
    PagesRoutesName.login: (context) => const LoginScreen()
  };
}

