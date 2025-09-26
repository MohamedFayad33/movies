import 'package:get_it/get_it.dart';
import 'package:movies_app/modules/auth/di/auth_di.dart';
import 'package:movies_app/modules/layout/details/di/details_di.dart';
import 'package:movies_app/modules/layout/home/di/home_di.dart';

GetIt sl = GetIt.instance;

abstract class AppDi {
  static void init() {
    AuthDi.setting();
    HomeDi.setting();
    DetailsDi.setting();
  }
}
