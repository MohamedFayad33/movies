import 'package:movies_app/core/helper/shared_preferences/shared_constanse.dart';
import 'package:movies_app/core/helper/shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  AuthLocalDataSource();
  SharedPreferences pref = AppSharedPreferences.prefe;

  Future<void> saveData(Map<String, dynamic> json) async {
    await pref.setString(SharedConstanse.userName, json['name']);
    await pref.setString(SharedConstanse.userEmail, json['email']);
    await pref.setString(SharedConstanse.userPhone, 'phone');
    await pref.setInt(SharedConstanse.userAvatar, json['avaterId']);
  }

  Future<void> saveToken(String token) async {
    await pref.setString(SharedConstanse.userToken, token);
  }
}
