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

  static Future<List<Employee>> getEmployees() async {
    final Database db = await getDBConnect();
    final List<Map<String, dynamic>> maps = await db.query('employees');
    return List.generate(maps.length, (i) {
      return Employee(
        name: maps[i]['name'],
        employeeID: maps[i]['employeeID'],
        phoneNum: maps[i]['phoneNum'],
      );
    });
  }

  static Future<void> addEmployee(Employee employee) async {
      final Database db = await getDBConnect();
      await db.insert(
        'employees',
        employee.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
  }

  static Future<void> deleteTable() async{
    final Database db = await getDBConnect();
    await db.execute( 
      "DROP TABLE employees",
    );
  }
}