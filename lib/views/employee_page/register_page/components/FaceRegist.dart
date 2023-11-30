import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/signController.dart';

class FaceRegist extends StatefulWidget {
  @override
  _FaceRegistState createState() => _FaceRegistState(); 
}

class _FaceRegistState extends State<FaceRegist> {
  final ctrl = Get.find<SignController>();

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
            Text('狀態:'), 
            Obx((){
              if(ctrl.faceIsRegisted.isTrue)
                return Text("已註冊");
              else 
                return Text("未註冊");}
            )
          ]
        ),
        ElevatedButton(
          child: Text("Scan"),
          onPressed: (){},
        ),
        SizedBox(height: 20), 
      ]
    );
  }
}
