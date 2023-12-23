import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class Employee {
  final String name;
  final String employeeID;
  final String phoneNum;

  Employee({required this.name, required this.employeeID, required this.phoneNum});
}
