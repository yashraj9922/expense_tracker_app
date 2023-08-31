import 'package:expense_tracker_app/Widgets/Expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/Models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        date: DateTime.now(),
        amount: 100,
        title: "title1",
        category: Category.travel),
    Expense(
        date: DateTime.now(),
        amount: 10.42,
        title: "title2",
        category: Category.work),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ), // Expanded() --> takes all the available space in the screen....and it can be used only inside a Column() or Row()
        ],
      ),
    );
  }
}
