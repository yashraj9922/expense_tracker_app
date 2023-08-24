import 'package:expense_tracker_app/modals/expense.dart';
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
        title: "title",
        category: Category.travel),
    Expense(
        date: DateTime.now(),
        amount: 10.42,
        title: "title1",
        category: Category.work),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("The Chart"),
          Text("Expenses list..."),
        ],
      ),
    );
  }
}
