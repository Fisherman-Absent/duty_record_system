import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/controller/sign_controller.dart';
import 'package:duty_record_system/controller/event_bus.dart';

class EmployeeIdInput extends StatefulWidget {
  const EmployeeIdInput({super.key});

  @override
  _EmployeeIdInputState createState() => _EmployeeIdInputState(); 
}

class _EmployeeIdInputState extends State<EmployeeIdInput> {
  final ctrl = Get.find<SignController>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 設定初始值
    _textEditingController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    eventBus.on<ClearEvent>().listen((event) {
      if(event.eventName == 'ClearSign'){
        _textEditingController.clear();
        setState(() {});
      }
    });
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
          TextFormField(
            controller: _textEditingController,
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
        ]
    );
  }
}