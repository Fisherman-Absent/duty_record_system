import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/controller/regist_controller.dart';
import 'package:duty_record_system/components/can_scroll.dart';
import './components/employee_id_input.dart';
import './components/name_input.dart';
import './components/face_regist.dart';
import './components/phone_number_input.dart';

import 'package:duty_record_system/database/employee_db.dart';
import 'package:duty_record_system/controller/event_bus.dart';

Future<void> addEmployee(String employeeId, String name, String phoneNum) async {
	final newEmployee = Employee(
    employeeId: employeeId,
    name: name,
    phoneNum: phoneNum,
	);
	await EmployeeDB.addEmployee(newEmployee);
}

class RegisterPage extends StatelessWidget {
  RegisterPage() {
    final registController = RegistController();
    Get.put(registController);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text("註冊資料"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body:CanScroll(
        Container(
        margin: EdgeInsets.all(25),
        child: Column(
          
          children: [
            EmployeeIdInput(),
            NameInput(),
            FaceRegist(),
            PhoneNumberInput(),
            SizedBox(height: 50,),
            ElevatedButton(
              child: Text("註冊"),
              onPressed: (){
                final ctrl = Get.find<RegistController>();
                debugPrint('employee: ${ctrl.employeeId.value}\nname: ${ctrl.name.value}\nphoneNum: ${ctrl.phoneNum.value}\n\n');
                if(ctrl.employeeId.value == ''){
                  Fluttertoast.showToast(
                    msg: "員工ID不可為空",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.black45,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
                else if(ctrl.name.value == ''){
                  Fluttertoast.showToast(
                    msg: "員工姓名不可為空",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.black45,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
                else{
                  addEmployee(ctrl.employeeId.value, ctrl.name.value, ctrl.phoneNum.value).then((result) {
                    eventBus.fire(DBEvent('Reload Table', ''));
                    Navigator.pop(context);
                  });
                }
              },
            ),
          ]),
      ),

      ),
    );
      
  }
}