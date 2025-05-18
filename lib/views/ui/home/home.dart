import 'package:flutter/material.dart';
import 'package:mini_chat_app/controller/global_state.dart';
import 'package:mini_chat_app/core/constant/constant.dart';
import 'package:mini_chat_app/core/constant/style.dart';
import 'package:mini_chat_app/views/ui/home/state/home_state.dart';
import 'package:mini_chat_app/views/ui/home/widgets/messages/messages.dart';
import 'package:mini_chat_app/views/ui/home/widgets/profile/profile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    return ChangeNotifierProvider(
      create: (context) => HomeState(),
      child: Consumer<HomeState>(
        builder: (context, state, child) {
          final tab = InitialConstant.currentBottomBar;
          return Scaffold(
            body: tab == 0 ? MessagesPage() : ProfilePage(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: InitialConstant.currentBottomBar,
              backgroundColor: styleMiniChat.colors.background.elevate,
              onTap: (value) => globalState.onClickButtonBar(value),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message,
                    color: tab == 0 ? Colors.indigo : Colors.grey,
                  ),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: tab == 1 ? Colors.indigo : Colors.grey,
                  ),
                  label: 'Account',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
