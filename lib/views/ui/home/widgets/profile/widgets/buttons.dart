import 'package:flutter/material.dart';
import 'package:mini_chat_app/controller/global_state.dart';
import 'package:mini_chat_app/core/constant/constant.dart';
import 'package:mini_chat_app/core/constant/style.dart';
import 'package:mini_chat_app/core/helpers/helper.dart';
import 'package:provider/provider.dart';

class SwitchThemeButton extends StatelessWidget {
  const SwitchThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalState>(
      builder: (context, state, child) {
        bool isDarkMode = InitialConstant.themeMode == ThemeMode.light?false:true;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wb_sunny,
              color: isDarkMode ? Colors.grey : Colors.orange,
            ),
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                isDarkMode = value;
                state.changeThemeMode();
              },
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.orange,
              inactiveTrackColor: Colors.orange.withValues(alpha: 0.4),
            ),
            Icon(
              Icons.nightlight_round,
              color: isDarkMode ? Colors.blue : Colors.grey,
            ),
          ],
        );
      },
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalState>(
      builder: (context, state, child) {
        return  InkWell(
          onTap: () => Helper.signOut(),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: styleMiniChat.colors.background.disabled,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Sign Out",
                style: styleMiniChat.text.bodyBold.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
