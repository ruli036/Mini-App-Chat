import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat_app/controller/global_state.dart';
import 'package:mini_chat_app/core/constant/constant.dart';
import 'package:mini_chat_app/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const InitializationApp());
}

class InitializationApp extends StatelessWidget {
  const InitializationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GlobalState()..checkLogin())],
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Mini Chat App',
          theme: Provider.of<GlobalState>(context).getThemeData,
          debugShowCheckedModeBanner: false,
          themeMode: InitialConstant.themeMode,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routerDelegate: AppRouter.router.routerDelegate,
        );
      },
    );
  }
}

