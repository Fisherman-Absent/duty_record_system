import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CheckIn {
  late int id;
  final String name;
  final String employeeId;
  final String onWork;
  final DateTime time;

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

class CheckDB {
  static Future<Database> getDBConnect() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'fisherman.db'),
      onCreate: (database, version) async {
        await database.execute("CREATE TABLE checkin(id INTEGER PRIMARY KEY AUTOINCREMENT, onWork TEXT, employeeId TEXT, name TEXT, time date)");
      },
      version: 1,
    );
  }

  static Future<List<CheckIn>> getCheckIn(String keyword) async {
    final Database db = await getDBConnect();
    final List<Map<String, dynamic>> maps = await db.query(
      'checkin',
      where: 'name LIKE ?',
      whereArgs: ['$keyword%'],
    );

    List<CheckIn> checkin = [];
    for (var row in maps) {
      checkin.add(
          CheckIn(
              onWork: row['onWork'],
              employeeId: row['employeeId'],
              name: row['name'],
              time: row['time']
          )
      );
      checkin.last.id = row['id'];
    }
    return checkin;
  }

  static Future<void> addCheckIn(CheckIn checkin) async {
    final Database db = await getDBConnect();
    await db.insert(
      'checkin',
      checkin.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteCheckIn(int id) async {
    final Database db = await getDBConnect();
    await db.delete(
      'checkin',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<void> deleteTable() async{
    final Database db = await getDBConnect();
    await db.execute(
      "DROP TABLE checkin",
    );
  }
}