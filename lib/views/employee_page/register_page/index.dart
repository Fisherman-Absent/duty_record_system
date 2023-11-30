import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/controller/regist_controller.dart';
import 'package:duty_record_system/components/can_scroll.dart';
import './components/employee_id_input.dart';
import './components/name_input.dart';
import './components/face_regist.dart';
import './components/phone_number_input.dart';


class RegisterPage extends StatelessWidget {
  RegisterPage() {
    final registController = RegistController();
    Get.put(registController);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: (){},
            ),
          ]),
      ),

      ),
    );
      
  }
}