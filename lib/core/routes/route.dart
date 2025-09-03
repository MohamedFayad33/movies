import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/modules/login/forget_password_screen.dart';
import 'package:movies_app/modules/login/login_screen.dart';

abstract class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    PagesRoutesName.login: (context) => LoginScreen(),
    PagesRoutesName.forget: (context) => ForgetPasswordScreen(),
  };
}
