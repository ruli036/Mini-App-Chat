import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat_app/core/constant/constant.dart';
import 'package:mini_chat_app/views/ui/home/home.dart';
import 'package:mini_chat_app/views/ui/home/widgets/messages/state/messages_state.dart';
import 'package:mini_chat_app/views/ui/home/widgets/messages/widget/chat.dart';
import 'package:mini_chat_app/views/ui/login/login.dart';

class Routes {
  static const login = "login";
  static const home = "home";
  static const message = "message";
}

final mobileRoutes = GoRouter(
  initialLocation: '/${InitialConstant.initialPage}',
  routes: [
    GoRoute(
      path: "/${Routes.login}",
      name: Routes.login,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: "/${Routes.home}",
      name: Routes.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: "/${Routes.message}",
      name: Routes.message,
      builder: (context, state) {
        MessagesState localState = state.extra as MessagesState;
        return ChatPage(localState: localState);
      },
    ),
  ],
);

class AppRouter {
  AppRouter._();

  static GoRouter get router {
    return mobileRoutes;
  }

  static BuildContext get context =>
      router.configuration.navigatorKey.currentContext!;

  static void pop<T extends Object?>([T? result]) {
    return router.pop<T>();
  }
}
