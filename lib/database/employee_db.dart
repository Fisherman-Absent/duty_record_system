import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class Employee {
  late int id;
  final String name;
  final String employeeId;
  final String phoneNum;

  Employee({required this.employeeId, required this.name, required this.phoneNum});
  Map<String, dynamic> toMap() {
    return {
      'employeeId': employeeId,
      'name': name,
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
           "CREATE TABLE employees(id INTEGER PRIMARY KEY AUTOINCREMENT, employeeId TEXT, name TEXT, phoneNum TEXT)",
      );
     },
     version: 1,
    );
  }

  static Future<List<Employee>> getEmployees(String keyword) async {
    final Database db = await getDBConnect();
    final List<Map<String, dynamic>> maps = await db.query(
      'employees', 
      where: 'name LIKE ?',
      whereArgs: ['$keyword%'],
    );

    List<Employee> employees = []; 
    for (var row in maps) {
      employees.add(
        Employee(
          employeeId: row['employeeId'],
          name: row['name'],
          phoneNum: row['phoneNum']
        )
      );
      employees.last.id = row['id'];
    }
    return employees;
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