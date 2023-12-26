import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:duty_record_system/controller/regist_controller.dart';

class FaceRegist extends StatefulWidget {
  const FaceRegist({super.key});

  @override
  _FaceRegistState createState() => _FaceRegistState(); 
}

class _FaceRegistState extends State<FaceRegist> {
  final ctrl = Get.find<RegistController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Icon(
              Icons.face_retouching_natural_sharp,  
              color: Colors.black,
              size: 18,
            ),
            SizedBox(width: 8), 
            Text(
              "臉部註冊",
              style: TextStyle(
                color: Colors.black,  
              ), 
            )
          ],
        ),
        Row(
          children: [
            const Text('狀態:'), 
            Obx((){
              if(ctrl.faceIsRegisted.isTrue) {
                return const Text("已註冊");
              } else {
                return const Text("未註冊");
              }}
            )
          ]
        ),
        ElevatedButton(
          child: const Text("Scan"),
          onPressed: (){},
        ),
        const SizedBox(height: 20), 
      ]
    );
  }
}
