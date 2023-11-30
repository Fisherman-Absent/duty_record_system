import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/colors.dart';
import '../../../controller/signController.dart';
import '../../../components/canScroll.dart';

import 'components/employeeIdInput.dart';
import 'components/nameInput.dart';
import 'components/FaceRegist.dart';
import 'components/phoneNumberInput.dart';


class RegisterPage extends StatelessWidget {
  RegisterPage() {
    final signController = SignController();
    Get.put(signController);
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
      
            // Row(
            //   children: [Icon(Icons.face_retouching_natural_sharp),Text("臉部註冊")]
            // ),
            // Row(
            //   children: [Text('狀態:'),Text("臉部註冊")]
            // ),
            // ElevatedButton(
            //   child: Text("Scan"),
            //   onPressed: (){},
            // ),
            // SizedBox(height: 20,),
            // Row(
            //   children: [Icon(Icons.local_phone_rounded),Text("電話號碼")]
            // ),
            // TextFormField(
            //   decoration: InputDecoration(border: OutlineInputBorder(),hintText: "input..."),
            // ),
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