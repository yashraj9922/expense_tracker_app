import 'package:expense_tracker_app/Models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '\u{20B9}${expense.amount.toStringAsFixed(2)}',
                ), // \u{20B9} --> symbol of a ruppee
                // need Category and Date side by side hence wraping them into a nested Row Widget
                const Spacer(), // Spacer() --> takes up all the space between 2 widgets
                Row(
                  children: [
                    // displaying icon of category
                    Icon(categoryIcons[expense.category]),

                    // space between category and date
                    const SizedBox(width: 12),

                    //adding date and time
                    Text(
                      // expense.getFormatteddate(),--> calling a method
                      expense.formattedDate, // calling a getter
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
