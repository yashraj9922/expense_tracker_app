import 'package:expense_tracker_app/Models/expense.dart';
import 'package:expense_tracker_app/Widgets/Expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // return Column(); --> this can be used for the List but when u have uncleard data...Listview
    // Column() --> this creates all the widgets(even if it 1000) at a time behind the scene...performance issues
    // return ListView(
    //   children: [],
    // ); --> always scrollable by default..

    //ListView.builder(); --> creates List only when they are visible or about to be visible and not when they are invisible
    return ListView.builder(
      //
      itemCount: expenses
          .length, // itemCount refers to how many Lists items will be rendered
      itemBuilder: (ctx, index) {
        // return Text(expenses[index].title);
        return ExpenseItem(expense: expenses[index]);
      },
      /* you can pass functions as parameters  */
    );
  }
}