import 'package:expense_tracker_app/Widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColourScheme = ColorScheme.fromSeed(seedColor: Colors.indigo);
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColourScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColourScheme.onPrimaryContainer,
            foregroundColor: Colors.white,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColourScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[100],
              foregroundColor: kColourScheme.onPrimaryContainer,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: kColourScheme.onPrimaryContainer),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColourScheme.onSecondaryContainer,
                    fontSize: 16),
              )),
      home: const Expenses(),
    ),
  );
}
