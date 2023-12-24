import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/controller/regist_controller.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({super.key});

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState(); 
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final ctrl = Get.find<RegistController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Icon(
              Icons.local_phone_rounded,  
              color: Colors.black,
              size: 18,
            ),
            SizedBox(width: 8), 
            Text(
              "電話號碼",
              style: TextStyle(
                color: Colors.black,  
              ), 
            )
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
            border : OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0)
            ),
            fillColor: inputFillColor,
            filled: true,
          ),
          onChanged: (value) {
            ctrl.employeeId.value = value;
          },
        ),
        const SizedBox(height: 20), 
      ]
    );
  }
}