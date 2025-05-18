import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_chat_app/core/component_ui/dialog.dart';
import 'package:mini_chat_app/core/constant/constant.dart';
import 'package:mini_chat_app/core/helpers/helper.dart';
import 'package:mini_chat_app/core/model/auth.dart';
import 'package:mini_chat_app/routes.dart';

class LoginState extends ChangeNotifier{
  Future<UserCredential?> signInWithGoogle() async {
    try {
      InitialConstant.currentBottomBar = 0;
      // Start sign in process
      final GoogleSignInAccount? googleUser = await InitialConstant.googleSignIn.signIn();
      if (googleUser == null) return null;
      DialogMiniChat.showLoadingDialog();
      // Obtain auth details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Sign in to Firebase
      final authData = await InitialConstant.auth.signInWithCredential(credential);
      setAuthData(authData.user);
      await Helper.saveDataPref(key: LocalDataKey.initialRoute,value: Routes.home);
      AppRouter.router.pushReplacementNamed(Routes.home);
      AppRouter.pop();
    } catch (e) {
      //handle failed login
      ScaffoldMessenger.of(AppRouter.context).showSnackBar(
        SnackBar(content: Text("Google Sign-In Error: $e")),
      );
      return null;
    }
    return null;
  }

  void setAuthData(User? user)async{
    // save data to local pref
    AuthData authData = AuthData(
      id: user?.uid??'',
      email: user?.email??'',
      name: user?.displayName??'',
      phone: user?.phoneNumber??"",
      urlPhoto: user?.photoURL??''
    );
    await Helper.saveDataPref(key: LocalDataKey.user,value: json.encode(authData));
  }
}