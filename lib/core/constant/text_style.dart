import 'package:flutter/material.dart';
import 'package:mini_chat_app/core/constant/style.dart';

class TextMiniChatStyle {
  TextStyle get titleLarge {
    return TextStyle(
      color: styleMiniChat.colors.text.base,
      fontSize: 28.0,
      height: 36 / 28.0,
      fontWeight: FontWeight.w400,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  TextStyle get titleBold {
    return TextStyle(
      color: styleMiniChat.colors.text.base,
      fontSize: 24.0,
      height: 32 / 24.0,
      fontWeight: FontWeight.w700,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  TextStyle get bodyRegular {
    return TextStyle(
      color: styleMiniChat.colors.text.base,
      fontSize: 16.0,
      height: 24 / 16.0,
      fontWeight: FontWeight.w400,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  TextStyle get bodyBold {
    return TextStyle(
      color: styleMiniChat.colors.text.base,
      fontSize: 16.0,
      height: 24 / 16.0,
      fontWeight: FontWeight.w700,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }
}
