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
import 'package:duty_record_system/controller/event_bus.dart';


Future<void> addCheckIn(bool onWork, String employeeId, String name,  String time) async {
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
    return Container(
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: WorkModeSwitch(),
            ),
            Expanded(
              flex: 10,
              child: EmployeeIdInput(),
            ),
            Expanded(
              flex: 10,
              child: NameInput(),
            ),
            Expanded(
              flex: 40,
              child: CameraScan(),
            ),
            ElevatedButton(
              child: const Text("打卡"),
              onPressed: () async {
                final ctrl = Get.find<SignController>();
                DateTime currentTime = DateTime.now();
                String formattedTime = currentTime.toIso8601String();
                CheckIn newCheckIn = CheckIn(
                  onWork: ctrl.onWork.value,
                  employeeId: ctrl.employeeId.value,
                  name: ctrl.name.value,
                  time: formattedTime,
                );
                await CheckInDB.addCheckIn(newCheckIn);
                ctrl.employeeId.value = "";
                ctrl.name.value ="";
              },
            )
          ],
        ));
  }
}
