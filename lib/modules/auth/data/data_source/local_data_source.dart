import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  static late SharedPreferences _sharedPreferences;
  AuthLocalDataSource();

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData(Map<String, dynamic> json) async {
    await _sharedPreferences.setString('name', json['name']);
    await _sharedPreferences.setString('email', json['email']);
    await _sharedPreferences.setString('phone', 'phone');
    await _sharedPreferences.setInt('avatar', json['avaterId']);
  }

  Future<void> saveToken(String token) async {
    await _sharedPreferences.setString('token', token);
  }

  static getToken() {
    var x = _sharedPreferences.get('token');
    print(x);
  }

  static Future<void> get() async {
    _sharedPreferences.getString('name');
    _sharedPreferences.getString('email');
    _sharedPreferences.getString('phone');
    _sharedPreferences.getInt('avatar');
  }
}
