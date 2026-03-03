import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color(0xFFFBF6F6),

);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD96868),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
       cardTheme: CardThemeData().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shadowColor: kColorScheme.error,
        
       ),
       elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer
       )),
       textTheme: ThemeData().textTheme.copyWith(
        headlineLarge: TextStyle(color: Color(0xff4C5C2D))
       )
      ),

      home: Expenses(),
    ),
  );
}
