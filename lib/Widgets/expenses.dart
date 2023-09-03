import 'package:expense_tracker_app/Widgets/Expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/Models/expense.dart';
import 'package:expense_tracker_app/Widgets/new_expense.dart';
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return NewExpense(onAddExpense: _addExpense,);
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker App"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add_card),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text("The Chart"),
          const SizedBox(height: 20),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ), // Expanded() --> takes all the available space in the screen....and it can be used only inside a Column() or Row()
        ],
      ),
    );
  }
}
