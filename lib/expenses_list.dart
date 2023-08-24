import 'dart:math';

import 'package:expense_tracker_app/modals/expense.dart';
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
    // ); --> always scrollavle by default..

    //ListView.builder(); --> creates List only when they are visible or about to be visible and not when they are invisible
    return ListView.builder(itemCount: expenses.length,// itemCount refers to how many Lists items will be rendered
      itemBuilder:(ctx, index) {
        return Text(expenses[index].title);
      },
       /* you can pass functions as parameters  */
    );
  }
}
