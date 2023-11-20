import 'package:expense_tracker_app/Widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// Generate a ColorScheme derived from the given seedColor
var kColourScheme = ColorScheme.fromSeed(
    seedColor: Colors.indigo, brightness: Brightness.light);

// Create the recommended dark color scheme that matches the baseline Material color scheme 
var kDarkColourScheme = const ColorScheme.dark(
  onPrimaryContainer: Colors.indigo,
  brightness: Brightness.dark,
);

void main() {
  // LOCKING THE ORIENTATION OF APP
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then(
  //   (value) =>
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //The [ThemeData] to use when a 'dark mode' is requested by the system
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColourScheme,
      ),
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
            ),
      ),
      // dark mode or light mode
      // themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
    // ),
  );
  // runApp(
  //   MaterialApp(
  //     darkTheme: ThemeData.dark().copyWith(
  //       useMaterial3: true,
  //       colorScheme: kDarkColourScheme,
  //     ),
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData().copyWith(
  //       useMaterial3: true,
  //       colorScheme: kColourScheme,
  //       appBarTheme: const AppBarTheme().copyWith(
  //         backgroundColor: kColourScheme.onPrimaryContainer,
  //         foregroundColor: Colors.white,
  //       ),
  //       cardTheme: const CardTheme().copyWith(
  //         color: kColourScheme.secondaryContainer,
  //         margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
  //       ),
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: Colors.blue[100],
  //           foregroundColor: kColourScheme.onPrimaryContainer,
  //         ),
  //       ),
  //       textButtonTheme: TextButtonThemeData(
  //         style: TextButton.styleFrom(
  //             foregroundColor: kColourScheme.onPrimaryContainer),
  //       ),
  //       textTheme: ThemeData().textTheme.copyWith(
  //             titleLarge: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: kColourScheme.onSecondaryContainer,
  //                 fontSize: 16),
  //           ),
  //     ),
  //     // dark mode or light mode
  //     // themeMode: ThemeMode.system,
  //     home: const Expenses(),
  //   ),
  // );
}
