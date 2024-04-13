import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: kColorScheme,
            useMaterial3: true,
            appBarTheme: AppBarTheme()
                .copyWith(backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.onPrimaryContainer,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 25))),
        debugShowCheckedModeBanner: false,
        home: Expenses());
  }
}
