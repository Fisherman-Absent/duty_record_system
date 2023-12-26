import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/sign_controller.dart';

class NameInput extends StatefulWidget {
  const NameInput({super.key});

  @override
  _NameInputState createState() => _NameInputState(); 
}

class _NameInputState extends State<NameInput> {
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
              "姓名",
              style: TextStyle(
                color: Colors.black,  
              ), 
            )
          ],
        ),
        CupertinoTextField( 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), 
            color: const Color(0xFFC9C9C9),
          ), 
          onChanged: (value) {
            ctrl.name.value = value;
          },
        ),
      ]
    );
  }
}
