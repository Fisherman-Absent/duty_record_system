import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/controller/regist_controller.dart';
import 'package:duty_record_system/components/can_scroll.dart';
import 'package:duty_record_system/database/employee_db.dart';
import 'package:duty_record_system/controller/event_bus.dart';

class EmployeeInfoPage extends StatelessWidget {

  final Employee employee;
  EmployeeInfoPage(this.employee, {super.key}) {

    final registController = RegistController();
    Get.put(registController);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('員工 - ${employee.name}'),

        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body:CanScroll(
        Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          
          children: [

            Text('員工ID: ${employee.employeeId}'),
            SizedBox(height: 10,),
            Text('員工姓名: ${employee.name}'),
            SizedBox(height: 10,),
            Text('電話號碼: ${employee.phoneNum}'),
            SizedBox(height: 50,),
            ElevatedButton(
              child: Text("刪除員工"),
              onPressed: (){
                EmployeeDB.deleteEmployee(employee.id).then((result) {
                  eventBus.fire(DBEvent('Reload Table', ''));
                  Navigator.pop(context);
                });
              },

            ),
          ]),
      ),

      ),
    );
      
  }
}