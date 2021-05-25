import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yammi/data/models/user/user.dart';

@lazySingleton
class UserLocalDatasource {
  static const String userKey = 'USER-KEY';
  final SharedPreferences _sharedPreferences;

  const UserLocalDatasource(this._sharedPreferences);

  Future<bool> storeUser(User user) async {
    return _sharedPreferences.setString(userKey, jsonEncode(user.toJson()));
  }

  User? getStoredUser() {
    final userJson = _sharedPreferences.getString(userKey);
    if (userJson == null) return null;

    return User.fromJson(jsonDecode(userJson) as Map<String, dynamic>);
  }
}