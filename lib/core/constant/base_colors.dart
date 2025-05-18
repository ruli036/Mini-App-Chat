import 'package:flutter/material.dart';

extension MaterialColorExt on MaterialColor {
  Color get shade0 => this[0]!;
  Color get shade25 => this[25]!;
  Color get shade950 => this[950]!;
}

class BaseColor {
  /// Default color
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  /// Base color always get the shade 500
  static const int _neutralValue = 0xFF878787;
  static const MaterialColor neutral = MaterialColor(
    _neutralValue,
    <int, Color>{
      950: Color(0xFF1A1A1A),
      900: Color(0xFF262626),
      800: Color(0xFF3D3D3D),
      700: Color(0xFF575757),
      600: Color(0xFF707070),
      500: Color(_neutralValue),
      400: Color(0xFFA1A1A1),
      300: Color(0xFFBABABA),
      200: Color(0xFFD1D1D1),
      100: Color(0xFFEBEBEB),
      50: Color(0xFFF7F7F7),
      0: Color(0xFFFFFFFF),
    },
  );

  /// Primary Color
  static const int _primaryValue = 0xFF80B4B4;
  static const MaterialColor primary = MaterialColor(
    _neutralValue,
    <int, Color>{
      950: Color(0xFF084F50),
      900: Color(0xFF148385),
      800: Color(0xFF398F91),
      700: Color(0xFF539B9C),
      600: Color(0xFF6AA7A8),
      500: Color(_primaryValue),
      400: Color(0xFF95C0C0),
      300: Color(0xFFABCCCD),
      200: Color(0xFFC0D9D9),
      100: Color(0xFFD5E6E6),
      50: Color(0xFFF3FAFA),
    },
  );

  /// Red Color
  static const int _redValue = 0xFFFF5448;
  static const MaterialColor red = MaterialColor(_redValue, <int, Color>{
    950: Color(0xFF7E0007),
    900: Color(0xFF930009),
    800: Color(0xFFA9020C),
    700: Color(0xFFBB1818),
    600: Color(0xFFDF362D),
    500: Color(_redValue),
    400: Color(0xFFFE897D),
    300: Color(0xFFFFB4AB),
    200: Color(0xFFFFDAD5),
    100: Color(0xFFFFEDEA),
    50: Color(0xFFFFF8F7),
  });

  /// Green Color
  static const int _greenValue = 0xFF1DA473;
  static const MaterialColor green = MaterialColor(_greenValue, <int, Color>{
    950: Color(0xFF00452D),
    900: Color(0xFF005236),
    800: Color(0xFF006040),
    700: Color(0xFF006C49),
    600: Color(0xFF00885D),
    500: Color(_greenValue),
    400: Color(0xFF44C18C),
    300: Color(0xFF64DCA6),
    200: Color(0xFFA0F4C9),
    100: Color(0xFFBFFFDB),
    50: Color(0xFFE8FFEF),
  });

  /// Orange Color
  static const int _orangeValue = 0xFF1DA473;
  static const MaterialColor orange = MaterialColor(_orangeValue, <int, Color>{
    950: Color(0xFF5B3100),
    900: Color(0xFF6B3B00),
    800: Color(0xFF7D4500),
    700: Color(0xFF8C4F01),
    600: Color(0xFFB16400),
    500: Color(_orangeValue),
    400: Color(0xFFF69326),
    300: Color(0xFFFFB877),
    200: Color(0xFFFFDCBF),
    100: Color(0xFFFFEEE1),
    50: Color(0xFFFFF8F5),
  });

  /// Blue Color
  static const int _blueValue = 0xFF1DA473;
  static const MaterialColor blue = MaterialColor(_blueValue, <int, Color>{
    950: Color(0xFF003D6B),
    900: Color(0xFF00497E),
    800: Color(0xFF00497E),
    700: Color(0xFF0161A5),
    600: Color(0xFF1C7AC9),
    500: Color(_blueValue),
    400: Color(0xFF66AFFF),
    300: Color(0xFF9FCAFF),
    200: Color(0xFFD2E4FF),
    100: Color(0xFFEAF1FF),
    50: Color(0xFFF8F9FF),
  });

  /// Purple Color
  static const int _purpleValue = 0xFF1DA473;
  static const MaterialColor purple = MaterialColor(_purpleValue, <int, Color>{
    950: Color(0xFF3D2396),
    900: Color(0xFF4931A2),
    800: Color(0xFF553FAE),
    700: Color(0xFF614CBB),
    600: Color(0xFF7A65D6),
    500: Color(_purpleValue),
    400: Color(0xFFAF9EFF),
    300: Color(0xFFCABEFF),
    200: Color(0xFFE7DEFF),
    100: Color(0xFFF4EEFF),
    50: Color(0xFFFDF8FF),
  });
}
