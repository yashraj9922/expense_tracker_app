import 'package:uuid/uuid.dart';
// uuid helps in generating unique IDs

const uuid = Uuid();
class Expense {
  Expense({
    required this.date,
    required this.amount,
    required this.title,
  }) : id = uuid.v4();// in dart "initializer Lists" can be used to initialize class properties (like "id") with values that are not receieved by constructor function arguments 
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  // need to build new id whenever the new Expense parameter is created...uuid(package in flutter)
}
