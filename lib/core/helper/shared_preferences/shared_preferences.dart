import 'package:shared_preferences/shared_preferences.dart';

abstract class AppSharedPreferences {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get prefe {
    if (_preferences == null) {
      throw Exception('Shared Preferences not init');
    }
    return _preferences!;
  }
}
