import 'package:flutter/cupertino.dart';
import 'package:mini_chat_app/core/helpers/helper.dart';
import 'package:mini_chat_app/core/model/auth.dart';

class ProfileState extends ChangeNotifier {
  AuthData? authData;

  Future<void> getAuthUser() async {
    authData = await Helper.getAuthData();
    notifyListeners();
  }
}
