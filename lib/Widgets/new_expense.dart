import 'package:flutter/material.dart';
import 'package:expense_tracker_app/Models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

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
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    // This will be executed only once...pickedDate gets the value
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    // tryParse('Hello') => null .... tryParse('1.23') => 1.23 --> Parse [source] as a double literal and return its value
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    // .trim() --> The string without any leading and trailing whitespace
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show error msg
      showDialog(
        context: context,
        builder: (ctx) =>
            // showing some alert msg
            AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text(
              "Please make sure a valid Category, Amount, Date or Title is entered"),
          actions: [
            TextButton(
              onPressed: () {
                //To close the Dialog msg
                Navigator.pop(ctx); // ctx is context connected to Dialog
              },
              child: const Text("Close"),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
          date: _selectedDate!,
          amount: enteredAmount,
          title: _titleController.text,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    // gets info of overlapping Widgets at bottom of the Screen
    // return LayoutBuilder(
    //   // LayoutBuilder --> used to get info about the available space on screen....it is a Widget
    //   builder: ((context, constraints) {
    //     final width = constraints.maxWidth; // getting max width available...now we can check for orientation using if else and change the ui accordingly
    return SizedBox(
      height: double.infinity,
      // using full sapce on screen when it is in landspace mode
      child: SingleChildScrollView(
        // making it Scrollable when used in landspcae mode
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
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
              Row(
                children: [
                  // wrap Textfield in Expanded as Textfield tries to ocuppy whole available space in flutter instead Expanded will restrict it till Screen Size
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '\u{20B9} ',
                        label: Text("Amount"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? "No date Selected"
                              : formatter.format(_selectedDate!),
                          // ! added to force dart to assume that it wont be null
                        ),
                        // const SizedBox(width: 10),
                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 5),
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            // value(same used in onChanged) will stored internally
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text("Submit"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ),
  // );

  // return SizedBox(
  //   height: double.infinity,// using full sapce on screen when it is in landspace mode
  //   child: SingleChildScrollView(// making it Scrollable when used in landspcae mode
  //     child: Padding(
  //       padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
  //       child: Column(
  //         children: [
  //           // Taking input from user
  //           TextField(
  //             // onChanged: _saveTitleInput,
  //             controller: _titleController,
  //             // maxLength: 50, --> maximum input text length
  //             // keyboardType: TextInputType.name, --> determines which virtual keyboard should be open when user taps the Textfield
  //             // adding label and decoration
  //             decoration: const InputDecoration(
  //               label: Text("Title"),
  //             ),
  //           ),
  //           const SizedBox(height: 20),
  //           Row(
  //             children: [
  //               // wrap Textfield in Expanded as Textfield tries to ocuppy whole available space in flutter instead Expanded will restrict it till Screen Size
  //               Expanded(
  //                 child: TextField(
  //                   controller: _amountController,
  //                   keyboardType: TextInputType.number,
  //                   decoration: const InputDecoration(
  //                     prefixText: '\u{20B9} ',
  //                     label: Text("Amount"),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(width: 6),
  //               Expanded(
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       _selectedDate == null
  //                           ? "No date Selected"
  //                           : formatter.format(
  //                               _selectedDate!), // ! added to force dart to assume that it wont be null
  //                     ),
  //                     // const SizedBox(width: 10),
  //                     IconButton(
  //                       onPressed: _presentDatePicker,
  //                       icon: const Icon(Icons.calendar_month),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 20),
  //           Row(
  //             children: [
  //               const SizedBox(width: 5),
  //               DropdownButton(
  //                 value: _selectedCategory,
  //                 items: Category.values
  //                     .map(
  //                       (category) => DropdownMenuItem(
  //                         // value(same used in onChanged) will stored internally
  //                         value: category,
  //                         child: Text(
  //                           category.name.toUpperCase(),
  //                         ),
  //                       ),
  //                     )
  //                     .toList(),
  //                 onChanged: (value) {
  //                   if (value == null) {
  //                     return;
  //                   }
  //                   setState(() {
  //                     _selectedCategory = value;
  //                   });
  //                 },
  //               ),
  //               const Spacer(),
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text("Cancel"),
  //               ),
  //               const SizedBox(width: 20),
  //               ElevatedButton(
  //                 onPressed: _submitExpenseData,
  //                 child: const Text("Submit"),
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   ),
  // );
}
// }
