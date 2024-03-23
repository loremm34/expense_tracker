import "package:flutter/material.dart";
import "package:expense_tracker/models/Expense.dart";

class Expenses extends StatefulWidget {
  Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpensese = [
    Expense(
        title: "Bebra",
        amount: 43.243,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Bebra2",
        amount: 0,
        date: DateTime(2023, 2, 11),
        category: Category.work)
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text("Flutter Expense Tracker"), Text("Expenses list")],
      ),
    );
  }
}
