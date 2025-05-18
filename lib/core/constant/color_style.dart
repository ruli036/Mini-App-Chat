import 'package:mini_chat_app/core/constant/base_colors.dart';
import 'package:flutter/material.dart';

class ColorsApp {
  MiniChatBackgroundColor background;
  MiniChatTextColor text;
  MiniChatBorderColor border;

  ColorsApp._({
    required this.background,
    required this.text, 
    required this.border, 
  });

  factory ColorsApp.light() {
    return ColorsApp._(
      background: MiniChatBackgroundColor.light(),
      text: MiniChatTextColor.light(), 
      border: MiniChatBorderColor.light(), 
    );
  }

  factory ColorsApp.dark() {
    return ColorsApp._(
      background: MiniChatBackgroundColor.dark(),
      text: MiniChatTextColor.dark(), 
      border: MiniChatBorderColor.dark(), 
    );
  }
}

class MiniChatBackgroundColor {
  Color base;
  Color field;
  Color disabled;
  Color grey;
  Color elevate;
  Color teal;
  Color tealLight;
  Color pressedHover;
  Color tealBg;

  MiniChatBackgroundColor._({
    required this.base,
    required this.field,
    required this.disabled,
    required this.grey,
    required this.elevate,
    required this.teal,
    required this.tealLight,
    required this.pressedHover,
    required this.tealBg,
  });

  factory MiniChatBackgroundColor.light() {
    return MiniChatBackgroundColor._(
      base: BaseColor.neutral.shade0,
      field: BaseColor.neutral.shade0,
      disabled: BaseColor.neutral.shade100,
      grey: BaseColor.neutral.shade50,
      elevate: BaseColor.neutral.shade0,
      teal: BaseColor.primary.shade900,
      tealLight: BaseColor.primary.shade50,
      pressedHover: BaseColor.primary.shade950,
      tealBg: BaseColor.primary.shade800,
    );
  }

  factory MiniChatBackgroundColor.dark() {
    return MiniChatBackgroundColor._(
      base: BaseColor.neutral.shade950,
      field: BaseColor.neutral.shade800,
      disabled: BaseColor.neutral.shade900,
      grey: BaseColor.neutral.shade900,
      elevate: BaseColor.neutral.shade900,
      teal: BaseColor.primary.shade600,
      tealLight: BaseColor.primary.shade400,
      pressedHover: BaseColor.primary.shade700,
      tealBg: BaseColor.primary.shade950,
    );
  }
}

class MiniChatTextColor {
  final Color base;
  final Color secondary;
  final Color button;
  final Color onActiveBg;
  final Color disabled;
  final Color error;
  final Color success;
  final Color link;

  MiniChatTextColor._({
    required this.base,
    required this.secondary,
    required this.button,
    required this.onActiveBg,
    required this.disabled,
    required this.error,
    required this.success,
    required this.link,
  });

  factory MiniChatTextColor.light() {
    return MiniChatTextColor._(
      base: BaseColor.neutral.shade900,
      secondary: BaseColor.neutral.shade500,
      button: BaseColor.neutral.shade0,
      onActiveBg: BaseColor.primary.shade900,
      disabled: BaseColor.neutral.shade500,
      error: BaseColor.red.shade700,
      success: BaseColor.green.shade600,
      link: BaseColor.primary.shade900,
    );
  }

  factory MiniChatTextColor.dark() {
    return MiniChatTextColor._(
      base: BaseColor.neutral.shade100,
      secondary: BaseColor.neutral.shade300,
      button: BaseColor.neutral.shade900,
      onActiveBg: BaseColor.primary.shade900,
      disabled: BaseColor.neutral.shade300,
      error: BaseColor.red.shade300,
      success: BaseColor.green.shade300,
      link: BaseColor.primary.shade600,
    );
  }
}

class MiniChatBorderColor {
  final Color base;
  final Color disabled;
  final Color light;
  final Color active;
  final Color error;

  MiniChatBorderColor._({
    required this.base,
    required this.disabled,
    required this.light,
    required this.active,
    required this.error,
  });

  factory MiniChatBorderColor.light() {
    return MiniChatBorderColor._(
      base: BaseColor.neutral.shade300,
      disabled: BaseColor.neutral.shade200,
      light: BaseColor.neutral.shade100,
      active: BaseColor.primary.shade900,
      error: BaseColor.red.shade700,
    );
  }

  factory MiniChatBorderColor.dark() {
    return MiniChatBorderColor._(
      base: BaseColor.neutral.shade700,
      disabled: BaseColor.neutral.shade800,
      light: BaseColor.neutral.shade900,
      active: BaseColor.primary.shade600,
      error: BaseColor.red.shade300,
    );
  }
}