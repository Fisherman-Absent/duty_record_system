import './checkin_db.dart';
import './employee_db.dart';

Future<void> addEmployee(String employeeId, String name, String phoneNum) async {
	final newEmployee = Employee(
    employeeId: employeeId,
    name: name,
    phoneNum: phoneNum,
	);
	await EmployeeDB.addEmployee(newEmployee);
}

Future<void> addCheckIn(int onWork, String employeeId, String name,  String time) async {
  final newCheckIn = CheckIn(
    onWork : onWork,
    employeeId: employeeId,
    name: name,
    time: time,
  );
  await CheckInDB.addCheckIn(newCheckIn);
}

void initData(){
  addEmployee("12345", "harrykuo1", "0912345678");
  addEmployee("45678", "jamessu", "0987654321");
  addCheckIn(1, "12345", "harrykuo1", "2023-12-25T09:23:38.122520");
  addCheckIn(0, "12345", "harrykuo1", "2023-12-25T09:31:38.122520");
  addCheckIn(1, "45678", "jamessu", "2023-12-25T11:15:38.122520");
  addCheckIn(0, "45678", "jamessu", "2023-12-25T11:31:38.122520");

  addCheckIn(1, "12345", "harrykuo1", "2023-12-26T08:48:38.122520");
  addCheckIn(0, "12345", "harrykuo1", "2023-12-26T10:26:38.122520");
  addCheckIn(1, "45678", "jamessu", "2023-12-26T11:58:38.122520");
  addCheckIn(0, "45678", "jamessu", "2023-12-26T12:31:38.122520");
}