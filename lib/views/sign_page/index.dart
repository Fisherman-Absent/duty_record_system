import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:duty_record_system/controller/sign_controller.dart';
import 'package:duty_record_system/style/colors.dart';

import 'package:duty_record_system/components/bottom_nav.dart';
import './components/work_mode_switch.dart';
import './components/employee_id_input.dart';
import './components/name_input.dart';

class SignPage extends StatelessWidget {
  SignPage() {
    final signController = SignController();
    Get.put(signController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("簽到"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body:SignBody(),
      bottomNavigationBar: BottomNavComponent(
        selectedIndex: 0, 
      ),
    );
  }
}

class SignBody extends StatelessWidget {
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
            flex: 20, 
            child: WorkModeSwitch(),
          ),
          Expanded(
            flex: 20, 
            child: EmployeeIdInput(),
          ),
          Expanded(
            flex: 20, 
            child: NameInput(),
          ),
          Expanded(
            flex: 70, 
            child: Text("1"),
          ),
        ],
      )
    );
  }
}

