import 'package:flutter/material.dart';
import 'package:mini_chat_app/core/constant/base_colors.dart';
import 'package:mini_chat_app/core/constant/color_style.dart';
import 'package:mini_chat_app/core/constant/constant.dart';
import 'package:mini_chat_app/core/helpers/helper.dart';
import 'package:mini_chat_app/routes.dart';

class GlobalState extends ChangeNotifier {
  ThemeData lightTheme = ThemeData(
    datePickerTheme: DatePickerThemeData(
      yearBackgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return BaseColor.primary.shade900;
        }
        return Colors.transparent;
      }),
      dayBackgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return BaseColor.primary.shade900;
        }
        return Colors.transparent;
      }),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(BaseColor.primary.shade900),
      ),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(BaseColor.primary.shade900),
      ),
      backgroundColor: BaseColor.neutral.shade0,
      headerBackgroundColor: BaseColor.neutral.shade0,
      headerForegroundColor: BaseColor.neutral.shade900,
      dayForegroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return BaseColor.neutral.shade0;
        } else if (state.contains(WidgetState.disabled)) {
          return BaseColor.neutral.shade200;
        }
        return BaseColor.neutral.shade900;
      }),
      todayBackgroundColor: WidgetStateProperty.all(BaseColor.primary.shade600),
      todayForegroundColor: WidgetStateProperty.all(BaseColor.neutral.shade0),
      rangePickerBackgroundColor: BaseColor.primary.shade500,
      inputDecorationTheme: InputDecorationTheme(
        // fillColor: Colors.grey[200],
        // filled: true,
        labelStyle: TextStyle(color: BaseColor.neutral.shade900),
        hintStyle: TextStyle(color: BaseColor.neutral.shade900),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: BaseColor.primary.shade900,
          ), // Border color when enabled
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: BaseColor.primary.shade900,
            width: 2,
          ), // Border color when focused
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: BaseColor.red.shade900,
          ), // Border color on error
        ),
      ),
    ),
    primaryColor: BaseColor.primary.shade900,
    primaryColorLight: BaseColor.primary.shade900,
    primaryColorDark: BaseColor.primary.shade900,
    primarySwatch: BaseColor.primary,
    appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: BaseColor.primary.shade900,
    ),
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    scaffoldBackgroundColor: ColorsApp
        .light()
        .background
        .base,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsApp
          .light()
          .border
          .active,
      selectionHandleColor: ColorsApp
          .light()
          .border
          .active,
      selectionColor: ColorsApp
          .light()
          .border
          .active
          .withValues(alpha: 0.3),
    ),
  );
  ThemeData darkTheme = ThemeData(
    datePickerTheme: DatePickerThemeData(
      yearBackgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return BaseColor.primary.shade900;
        }
        return Colors.transparent;
      }),
      dayBackgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return BaseColor.primary.shade900;
        }
        return Colors.transparent;
      }),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(BaseColor.primary.shade900),
      ),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(BaseColor.primary.shade900),
      ),
      backgroundColor: BaseColor.neutral.shade0,
      headerBackgroundColor: BaseColor.neutral.shade0,
      headerForegroundColor: BaseColor.neutral.shade900,
      dayForegroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return BaseColor.neutral.shade0;
        } else if (state.contains(WidgetState.disabled)) {
          return BaseColor.neutral.shade200;
        }
        return BaseColor.neutral.shade900;
      }),
      todayBackgroundColor: WidgetStateProperty.all(BaseColor.primary.shade600),
      todayForegroundColor: WidgetStateProperty.all(BaseColor.neutral.shade0),
      rangePickerBackgroundColor: BaseColor.primary.shade500,
      inputDecorationTheme: InputDecorationTheme(
        // fillColor: Colors.grey[200],
        // filled: true,
        labelStyle: TextStyle(color: BaseColor.neutral.shade900),
        hintStyle: TextStyle(color: BaseColor.neutral.shade900),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: BaseColor.primary.shade900,
          ), // Border color when enabled
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: BaseColor.primary.shade900,
            width: 2,
          ), // Border color when focused
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: BaseColor.red.shade900,
          ), // Border color on error
        ),
      ),
    ),
    primaryColor: BaseColor.primary.shade900,
    primaryColorLight: BaseColor.primary.shade900,
    primaryColorDark: BaseColor.primary.shade900,
    primarySwatch: BaseColor.primary,
    appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: BaseColor.primary.shade900,
    ),
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    scaffoldBackgroundColor: ColorsApp
        .dark()
        .background
        .base,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsApp
          .dark()
          .border
          .active,
      selectionHandleColor: ColorsApp
          .dark()
          .border
          .active,
      selectionColor: ColorsApp
          .dark()
          .border
          .active
          .withValues(alpha: 0.3),
    ),
  );

  ThemeData get getThemeData {
    // set theme app
    if (InitialConstant.themeMode == ThemeMode.dark) {
      return darkTheme;
    }
    return lightTheme;
  }

  void changeThemeMode() async {
    // change theme app
    if (InitialConstant.themeMode == ThemeMode.dark) {
      InitialConstant.themeMode = ThemeMode.light;
      await Helper.saveDataPref(
        key: LocalDataKey.isDarkMode,
        value: "false",
      );
    } else {
      InitialConstant.themeMode = ThemeMode.dark;
      await Helper.saveDataPref(key: LocalDataKey.isDarkMode, value: "true");
    }
    notifyListeners();
  }

  void checkLogin() async {
    // check is user already login
    InitialConstant.currentBottomBar = 0;
    InitialConstant.initialPage = await Helper.getDataPref(
      LocalDataKey.initialRoute,
      defaultData: Routes.login,
    );
    final theme = await Helper.getDataPref(
      LocalDataKey.isDarkMode,
      defaultData: 'false',
    );
    InitialConstant.themeMode = theme == "true" ? ThemeMode.dark : ThemeMode.light;
    if (InitialConstant.initialPage == Routes.home) {
      AppRouter.router.pushReplacementNamed(Routes.home);
    }
  }

  onClickButtonBar(int index) {
    // change page in home
    InitialConstant.currentBottomBar = index;
    notifyListeners();
  }
}
