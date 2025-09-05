import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/pages_routes_name.dart';
import 'package:movies_app/core/routes/route.dart';
import 'package:movies_app/core/theme/theme_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoutesName.onBoarding,
      theme: ThemeManager.theme,
      routes: Routes.routes,
    );
  }
}
