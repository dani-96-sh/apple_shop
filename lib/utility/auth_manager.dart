import 'package:apple_shop/di.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final SharedPreferences _sharedPreferences = locator.get();
  static final ValueNotifier<String?> authChangeNotifire = ValueNotifier(null);
  static void saveToken(String token) async {
    _sharedPreferences.setString('access_token', token);
    authChangeNotifire.value = token;
  }

  static String readAuth() {
    return _sharedPreferences.getString('access_token') ?? '';
  }

  static void logout() {
    _sharedPreferences.clear();
    authChangeNotifire.value = null;
  }
}
