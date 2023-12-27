import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CheckIn {
  late int id;
  final String name;
  final String employeeId;
  final int onWork;
  final String time;

  CheckIn({
    required this.onWork,
    required this.employeeId,
    required this.name,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'onWork' : onWork,
      'employeeId': employeeId,
      'name': name,
      'time': time,
    };
  }
}

class CheckInDB {
  static Future<Database> getDBConnect() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'fisherman_220.db'),
      onCreate: (database, version) async {
        await database.execute("CREATE TABLE checkIn(id INTEGER PRIMARY KEY AUTOINCREMENT, onWork INTEGER, employeeId TEXT, name TEXT, time Text)");
      },
      version: 1,
    );
  }

  static Future<List<CheckIn>> getCheckIn(String keyword_Name, String keyword_date) async {
    final Database db = await getDBConnect();
    final List<Map<String, dynamic>> maps_time = await db.query(
      'checkIn',
      // where: 'time LIKE ?',
      where: 'name LIKE ? AND time LIKE ?',
      whereArgs: ['$keyword_Name%', '$keyword_date%'],
      // whereArgs: ['$keyword_date%'],
    );

    final List<Map<String, dynamic>> maps_date = await db.query(
      'checkIn',
      where: 'time LIKE ?',
      // where: 'name LIKE ? AND time LIKE ?',
      // whereArgs: ['$keyword_Name%', '$keyword_date%'],
      whereArgs: ['$keyword_date%'],
    );

    List<CheckIn> checkIn = [];
    // print("*********************");
    // print("checkin_db.dart-1");
    // print(maps.length);
    // print(maps);
    // print("*********************");
    if(keyword_Name == keyword_date){
      for (var row in maps_time) {
      checkIn.add(
          CheckIn(
              onWork: row['onWork'],
              employeeId: row['employeeId'],
              name: row['name'],
              time: row['time']
          )
      );
      checkIn.last.id = row['id'];
      }
    }else if(keyword_date == ''){
      for (var row in maps_time) {
      checkIn.add(
          CheckIn(
              onWork: row['onWork'],
              employeeId: row['employeeId'],
              name: row['name'],
              time: row['time']
          )
      );
      checkIn.last.id = row['id'];
      }
    }else{
      for (var row in maps_time) {
      checkIn.add(
          CheckIn(
              onWork: row['onWork'],
              employeeId: row['employeeId'],
              name: row['name'],
              time: row['time']
          )
      );
      checkIn.last.id = row['id'];
      } 
    }
      
    // print("*********************");
    // print("checkin_db.dart-2");
    // print(checkIn);
    // print("*********************");
    return checkIn;
  }

  static Future<void> addCheckIn(CheckIn checkIn) async {
    final Database db = await getDBConnect();
    await db.insert(
      'checkIn',
      checkIn.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteCheckIn(int id) async {
    final Database db = await getDBConnect();
    await db.delete(
      'checkIn',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<void> deleteTable() async{
    final Database db = await getDBConnect();
    await db.execute(
      "DROP TABLE checkIn",
    );
  }
}