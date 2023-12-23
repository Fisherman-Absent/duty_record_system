import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class Employee {
  final String name;
  final String employeeID;
  final String phoneNum;

  Employee({required this.name, required this.employeeID, required this.phoneNum});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'employeeID': employeeID,
      'phoneNum': phoneNum,
    };
  }
}

class EmployeeDB {
  static Future<Database> getDBConnect() async {
    String path = await getDatabasesPath();
    
    return openDatabase(
      join(path, 'fisherman.db'),
      onCreate: (database, version) async {
         await database.execute( 
           "CREATE TABLE employees(name TEXT, employeeID TEXT, phoneNum TEXT)",
      );
     },
     version: 1,
    );
  }
}