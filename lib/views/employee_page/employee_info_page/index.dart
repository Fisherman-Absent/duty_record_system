import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/controller/regist_controller.dart';
import 'package:duty_record_system/components/can_scroll.dart';


class EmployeeInfoPage extends StatelessWidget {
  EmployeeInfoPage({super.key}) {
    final registController = RegistController();
    Get.put(registController);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("員工xxx的資料"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body:CanScroll(
        Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          
          children: [
            const Text("test"),
            const SizedBox(height: 50,),
            ElevatedButton(
              child: const Text("註冊"),
              onPressed: (){},
            ),
          ]),
      ),

      ),
    );
      
  }
}