import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/modules/auth/forget_password_screen.dart';
import 'package:movies_app/modules/auth/login_screen.dart';
import 'package:movies_app/modules/auth/register_view.dart';
import 'package:movies_app/modules/layout/layout_view.dart';
import 'package:movies_app/modules/onBoarding_view/on_boarding_screen_view.dart';
import 'package:movies_app/modules/splash/splash_view.dart';

abstract class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    PagesRoutesName.splash: (context) => const SplashView(),
    PagesRoutesName.onBoarding: (context) => const OnBoardingScreenView(),
    PagesRoutesName.login: (context) => const LoginScreen(),
    PagesRoutesName.register: (context) => const RegisterView(),
    PagesRoutesName.forget: (context) => const ForgetPasswordScreen(),
    PagesRoutesName.layout: (context) => const LayoutView(),
  };
}
