import "package:expense_tracker/widgets/expenses_list.dart";
import "package:expense_tracker/widgets/new_expenses.dart";
import "package:flutter/material.dart";
import "package:expense_tracker/models/expense.dart";

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
        date: DateTime.now(),
        category: Category.work)
  ];

  void _openAddModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpenses(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker App"),
        actions: [
          SizedBox(
            width: 8,
          ),
          IconButton(onPressed: _openAddModalSheet, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesList(expenses: _registeredExpensese),
          ),
        ],
      ),
    );
  }
}
