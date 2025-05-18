import 'dart:convert';

import 'package:mini_chat_app/core/component_ui/dialog.dart';
import 'package:mini_chat_app/core/constant/constant.dart';
import 'package:mini_chat_app/core/model/auth.dart';
import 'package:mini_chat_app/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  /// save data local from pref
  static Future<void> saveDataPref({String key = '', String value = ''}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  /// get data local from pref
  static Future<String> getDataPref(String key, {dynamic defaultData}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? defaultData;
  }

  /// delete all data pref
  static Future<void> clearAllPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  /// log out from account
  static Future<void> signOut() async {
    DialogMiniChat.showLoadingDialog();
    await InitialConstant.auth.signOut();
    await InitialConstant.googleSignIn.signOut();
    await Helper.clearAllPreferences();
    AppRouter.pop();
    AppRouter.router.pushReplacementNamed(Routes.login);
  }

  /// get auth data
  static Future<AuthData> getAuthData() async {
    final data = await Helper.getDataPref(LocalDataKey.user);
    Map<String, dynamic> userMap = json.decode(data);
    return AuthData.fromJson(userMap);
  }
}
