import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

// var _enteredTitle = '';
// void _saveTitleInput(String inputValue) {
//   _enteredTitle = inputValue;
// }

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();

  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Taking input from user
          TextField(
            // onChanged: _saveTitleInput,
            controller: _titleController,
            maxLength: 50, // maximum input text length

            // keyboardType: TextInputType.name, --> determines which virtual keyboard should be open when user taps the Textfield

            // adding label and decoration
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // print(_enteredTitle);
              print(_titleController.text);
            },
            child: const Text("Submit"),
          )
        ],
      ),
    );
  }
}
