import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/colors.dart';
import '../../../controller/signController.dart';

class EmployeeIdInput extends StatefulWidget {
  @override
  _EmployeeIdInputState createState() => _EmployeeIdInputState(); 
}

class _EmployeeIdInputState extends State<EmployeeIdInput> {
  final ctrl = Get.find<SignController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Icon(
              Icons.people,  
              color: Colors.black,
              size: 18,
            ),
            SizedBox(width: 8), 
            Text(
              "員工ID",
              style: TextStyle(
                color: Colors.black,  
              ), 
            )
          ],
        ),
        CupertinoTextField( 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), 
            color: Color(0xFFC9C9C9),
          ), 
          onChanged: (value) {
            ctrl.employeeId.value = value;
          },
        ),
      ]
    );
  }
}
