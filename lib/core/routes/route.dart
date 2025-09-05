import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/modules/auth/register_view.dart';
import 'package:movies_app/modules/layout/layout_view.dart';
import 'package:movies_app/modules/splash/splash_view.dart';

abstract class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    PagesRoutesName.splash: (context) => const SplashView(),
    PagesRoutesName.register: (context) => const RegisterView(),
    PagesRoutesName.layout: (context) => const LayoutView(),
  };
}
