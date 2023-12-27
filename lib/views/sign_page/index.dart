import 'package:duty_record_system/components/can_scroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:duty_record_system/controller/sign_controller.dart';
import 'package:duty_record_system/style/colors.dart';

import 'package:duty_record_system/components/bottom_nav.dart';
import './components/work_mode_switch.dart';
import './components/employee_id_input.dart';
import './components/name_input.dart';
import './components/cameraScan.dart';

import 'package:duty_record_system/database/checkin_db.dart';
import 'package:duty_record_system/database/employee_db.dart';
import 'package:duty_record_system/controller/event_bus.dart';

import 'package:fluttertoast/fluttertoast.dart';



Future<void> addCheckIn(int onWork, String employeeId, String name,  String time) async {
  final newCheckIn = CheckIn(
    onWork : onWork,
    employeeId: employeeId,
    name: name,
    time: time,
  );
  await CheckInDB.addCheckIn(newCheckIn);
}


class SignPage extends StatelessWidget {
  SignPage({super.key}) {
    final signController = SignController();
    Get.put(signController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("簽到"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body: const SignBody(),
      bottomNavigationBar: BottomNavComponent(
        selectedIndex: 0,
      ),
    );
  }
}

class SignBody extends StatelessWidget {
  const SignBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return CanScroll(Container(
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: WorkModeSwitch(),
            ),
            Expanded(
              flex: 5,
              child: EmployeeIdInput(),
            ),
            Expanded(
              flex: 5,
              child: NameInput(),
            ),
            Expanded(
              flex: 20,
             child: CameraScan(),
            ),
            ElevatedButton(
              child: const Text("打卡"),
              onPressed: () async {
                final ctrl = Get.find<SignController>();
                String formattedTime = DateTime.now().toIso8601String();
                EmployeeInfo employeeInfo = await EmployeeDB.isEmployeeIdExists(ctrl.employeeId.value);
                debugPrint('Employee value:${ctrl.employeeId.value}');
                if(ctrl.employeeId.value==""){
                  debugPrint("no value");
                  Fluttertoast.showToast(
                    msg: "員工ID不可留空",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: appBarBGColor,
                    textColor: Colors.black,
                    fontSize: 16.0
                  );
                }
                else if(! employeeInfo.exists){
                  Fluttertoast.showToast(
                      msg: "員工ID錯誤!!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: appBarBGColor,
                      textColor: Colors.black,
                      fontSize: 16.0
                  );
                }
                else{
                  ctrl.name.value = employeeInfo.name??'';
                  CheckIn newCheckIn = CheckIn(
                    onWork: ctrl.onWork.value? 1 : 0,
                    employeeId: ctrl.employeeId.value,
                    name: ctrl.name.value,
                    time: formattedTime,
                  );
                  debugPrint('date: $formattedTime');
                  await CheckInDB.addCheckIn(newCheckIn);
                  ctrl.employeeId.value = "";
                  ctrl.name.value ="";
                  eventBus.fire(ClearEvent('ClearSign'));
                }
              },
                
            )
          ],
        )));
  }
}
