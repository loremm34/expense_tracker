import "package:expense_tracker/widgets/expenses_list.dart";
import "package:expense_tracker/widgets/new_expenses.dart";
import "package:flutter/material.dart";
import "package:expense_tracker/models/expense.dart";

class Expenses extends StatefulWidget {
  const Expenses({super.key});

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
      // isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(onAddExpense: _addExpenses),
    );
  }

  void _addExpenses(Expense expenses) {
    setState(() {
      _registeredExpensese.add(expenses);
    });
  }

  void _removeExpenses(Expense expenses) {
    final expensesIndex = _registeredExpensese.indexOf(expenses);
    setState(() {
      _registeredExpensese.remove(expenses);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpensese.insert(expensesIndex, expenses);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text("Try to add some new expenses!"));
    if (_registeredExpensese.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpensese,
        onRemoveExpense: _removeExpenses,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker App"),
        actions: [
          const SizedBox(
            width: 8,
          ),
          IconButton(onPressed: _openAddModalSheet, icon: const Icon(Icons.add), color: Colors.white,)
        ],
      ),
      body: Column(
        children: [
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
