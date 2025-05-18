import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_chat_app/core/model/message.dart';
import 'package:mini_chat_app/routes.dart';

class InitialConstant {
  static ThemeMode themeMode = ThemeMode.light;
  static String initialPage = Routes.login;
  static FirebaseAuth auth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();
  static int currentBottomBar = 0;
  static List<ChatMessage> messages = [];
}

class LocalDataKey {
  static String initialRoute = 'initial_route';
  static String isDarkMode = 'is_dark_mode';
  static String user = 'user';
}
