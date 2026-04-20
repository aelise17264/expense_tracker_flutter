import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Color(0xFFFBF6F6));

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color(0xff41644A),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: CardThemeData().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          shadowColor: kDarkColorScheme.error,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          headlineLarge: TextStyle(color: Color(0xffFBF6F6)),
          headlineMedium: TextStyle(
            color: Color(0xffFBF6F6),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Color(0xffFBF6F6), fontSize: 15),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kDarkColorScheme.inversePrimary,
          foregroundColor: kDarkColorScheme.inverseSurface,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD96868),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          shadowColor: kColorScheme.error,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          headlineLarge: TextStyle(color: Color(0xff4C5C2D)),
          headlineMedium: TextStyle(
            color: Color(0xff6A7E3F),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Color(0xff4C5C2D), fontSize: 15),
        ),
        iconTheme: IconThemeData().copyWith(color: Color(0xff4C5C2D)),
      ),
      themeMode: ThemeMode.system,
      home: Expenses(),
    ),
  );

  });
}