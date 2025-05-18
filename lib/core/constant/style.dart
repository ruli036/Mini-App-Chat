import 'package:flutter/material.dart';
import 'package:mini_chat_app/core/constant/color_style.dart';
import 'package:mini_chat_app/core/constant/constant.dart';
import 'package:mini_chat_app/core/constant/text_style.dart';

class StyleMiniChatApp {
  ColorsApp colors;
  TextMiniChatStyle text;

  StyleMiniChatApp._({required this.colors, required this.text});

  factory StyleMiniChatApp.dark() {
    return StyleMiniChatApp._(
      colors: ColorsApp.dark(),
      text: TextMiniChatStyle(),
    );
  }

  factory StyleMiniChatApp.light() {
    return StyleMiniChatApp._(
      colors: ColorsApp.light(),
      text: TextMiniChatStyle(),
    );
  }
}

StyleMiniChatApp get styleMiniChat {
  if (InitialConstant.themeMode == ThemeMode.dark) {
    return StyleMiniChatApp.dark();
  }
  return StyleMiniChatApp.light();
}
