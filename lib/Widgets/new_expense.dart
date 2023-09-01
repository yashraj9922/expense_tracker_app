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
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
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
            // maxLength: 50, --> maximum input text length

            // keyboardType: TextInputType.name, --> determines which virtual keyboard should be open when user taps the Textfield

            // adding label and decoration
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\u{20B9} ',
              label: Text("Amount"),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // print(_enteredTitle);
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: const Text("Submit"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
