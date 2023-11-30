import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/colors.dart';
import '../../../controller/RegistController.dart';
import '../../../components/canScroll.dart';

import 'components/employeeIdInput.dart';
import 'components/nameInput.dart';
import 'components/faceRegist.dart';
import 'components/phoneNumberInput.dart';


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