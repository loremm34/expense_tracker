import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 195),
    brightness: Brightness.dark);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color.fromARGB(255, 36, 34, 34),
          contentTextStyle: TextStyle(color: Colors.white)
          
        ),
        cardTheme: const CardTheme(
          color: Color.fromARGB(255, 48, 99, 151),
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        ),
        colorScheme: kDarkScheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 5, 99, 195),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      theme: ThemeData(
        colorScheme: kColorScheme,
        cardTheme: CardTheme(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge:
                const TextStyle(fontWeight: FontWeight.normal, fontSize: 24)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const Expenses(),
    );
  }
}
