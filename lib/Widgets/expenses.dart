import 'package:expense_tracker_app/Widgets/Chart/chart.dart';
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
  final List<Expense> _registeredExpenses = [];
  //   Expense(
  //       date: DateTime.now(),
  //       amount: 100,
  //       title: "title1",
  //       category: Category.travel),
  //   Expense(
  //       date: DateTime.now(),
  //       amount: 10.42,
  //       title: "title2",
  //       category: Category.work),
  // ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      // making sure that Widgets do not overlap with mobile's physical features
      useSafeArea: true,

      // creating full screen modal
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(
          onAddExpense: _addExpense,
        );
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(
      () {
        _registeredExpenses.add(expense);
      },
    );
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(
      () {
        _registeredExpenses.remove(expense);
      },
    );
    // clearing snackbars when multiples are removed suddenly
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(
              () {
                _registeredExpenses.insert(expenseIndex, expense);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // in order to make ui change on changing orientation of app....we need to first check width available
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No Expenses added"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
      body: width < 600
          ? Column(
              children: [
                const SizedBox(height: 20),
                Chart(expenses: _registeredExpenses),
                const SizedBox(height: 20),
                Expanded(
                  child: mainContent,
                ), // Expanded() --> takes all the available space in the screen....and it can be used only inside a Column() or Row()
              ],
            )
          : Row(
              // Row tries to get as much as width available
              children: [
                const SizedBox(width: 10),
                // Chart(expenses: _registeredExpenses),// we wraped Chart in Container which has width: double.infinity assigned which allows Chart Widget to get as much as width available
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ), //hence when Parent Widget and child has this problem we wrap it with Expanded Widget making Flutter easy
                const SizedBox(width: 10),
                Expanded(
                  child: mainContent,
                ), // Exapnded constraints the child to take as much width as available in the Row after sizing the other childern of Row
              ],
            ),
    );
  }
}
