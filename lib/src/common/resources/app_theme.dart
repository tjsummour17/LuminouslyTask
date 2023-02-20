import 'package:flutter/material.dart';
import 'package:luminously/src/common/resources/app_colors.dart';

class AppTheme {
  static const String fontFamily = "SFProDisplay";
  static const shadowColor = Color(0x19000000);
  static const ColorScheme _lightColorScheme = ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.backgroundLight,
  );
  static const ColorScheme _darkColorScheme = ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.backgroundDark,
  );

  static ThemeData get light => ThemeData(
        fontFamily: fontFamily,
        colorScheme: _lightColorScheme,
        shadowColor: const Color(0xAAC2C2C2),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _lightColorScheme.onSurface,
            fontFamily: fontFamily,
          ),
          backgroundColor: const Color(0xFFF9F9F9),
          elevation: 0,
        ),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: _lightColorScheme.onSurface,
          labelColor: _lightColorScheme.primary,
          labelStyle: TextStyle(
            color: _lightColorScheme.primary,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: shadowColor,
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
              )
            ],
            color: _lightColorScheme.surface,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: const BorderSide(width: 0.5),
          checkColor: MaterialStateColor.resolveWith(
            (states) => _lightColorScheme.surface,
          ),
          fillColor: MaterialStateColor.resolveWith(
            (states) => _lightColorScheme.primary,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashRadius: 25,
          visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(175, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.filedLight,
          suffixStyle: TextStyle(color: _lightColorScheme.onSurface),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.filedBorder),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _lightColorScheme.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _lightColorScheme.error),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _lightColorScheme.primary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.filedBorder),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Colors.white),
        ),
      );

  static ThemeData get dark => ThemeData(
        fontFamily: fontFamily,
        colorScheme: _darkColorScheme,
        shadowColor: const Color(0xAAF2F2F2),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(175, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.fieldDark,
          suffixStyle: TextStyle(color: _darkColorScheme.onSurface),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _darkColorScheme.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _darkColorScheme.error),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: _darkColorScheme.primary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: const Color(0xFF303030),
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _darkColorScheme.onSurface,
            fontFamily: fontFamily,
          ),
        ),
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Colors.white),
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: TextStyle(
            fontFamily: fontFamily,
            color: _darkColorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          labelColor: _darkColorScheme.primary,
          unselectedLabelStyle: TextStyle(
            fontFamily: fontFamily,
            color: _darkColorScheme.primary,
            fontSize: 16,
          ),
          unselectedLabelColor: _darkColorScheme.onSurface,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: shadowColor,
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
              )
            ],
            color: _darkColorScheme.surface,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: const BorderSide(width: 0.5),
          checkColor: MaterialStateColor.resolveWith(
            (states) => _darkColorScheme.surface,
          ),
          fillColor: MaterialStateColor.resolveWith(
            (states) => _darkColorScheme.primary,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashRadius: 25,
          visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
        ),
      );
}
