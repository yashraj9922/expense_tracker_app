import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

// uuid helps in generating unique IDs
// need to build new id whenever the new Expense parameter is created...uuid(package in flutter)
const uuid = Uuid();

enum Category { food, travel, leisure, work }
// allows to create custom type....combination of predefined allowed values
//fixed sets of values

const categoryIcons = {
  //mapping icons with enum keys i.e., category item
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.date,
    required this.amount,
    required this.title,
    required this.category,
  }) : id = uuid // in dart "initializer Lists" can be used to initialize class properties (like "id") with values that are not receieved by constructor function arguments
            .v4(); // generates a random String id
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // Using getters in place of methods[getFormatteddate();]
  String get formattedDate {
    return formatter.format(date);
  }

  getFormatteddate() {
    return formatter.format(date);
  }
}
