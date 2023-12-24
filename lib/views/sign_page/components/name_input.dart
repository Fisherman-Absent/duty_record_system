import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:duty_record_system/controller/sign_controller.dart';

class NameInput extends StatefulWidget {
  @override
  _NameInputState createState() => _NameInputState(); 
}

class _NameInputState extends State<NameInput> {
  final ctrl = Get.find<SignController>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 設定初始值
    _textEditingController.text = ctrl.name.value;
  }

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
          Obx(() {
            // 更新文本控制器的值
            _textEditingController.text = ctrl.name.value;

            return CupertinoTextField(
              controller: _textEditingController,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFC9C9C9),
              ),
              onChanged: (value) {
                ctrl.name.value = value;
              },
            );
          }),
        ]
    );
  }
}

