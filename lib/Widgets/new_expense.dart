import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Taking input from user
          TextField(
            maxLength: 50, // maximum input text length

            // keyboardType: TextInputType.name, --> determines which virtual keyboard should be open when user taps the Textfield

            // adding label and decoration
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
        ],
      ),
    );
  }
}
