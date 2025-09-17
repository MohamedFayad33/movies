import 'package:flutter/material.dart';
import 'package:movies_app/core/di/app_di.dart';
import 'package:movies_app/core/helper/shared_preferences/shared_preferences.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/core/routes/route.dart';
import 'package:movies_app/core/theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();
  AppDi.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeManager.theme,
      initialRoute: PagesRoutesName.splash,
      routes: Routes.routes,
    );
  }
}
