import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duty_record_system/style/colors.dart';
import './components/cameraScan.dart';

class RegistCameraPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("掃描臉部特徵"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body: const RegistCameraBody(),
    );
  }
}

class RegistCameraBody extends StatelessWidget {
  const RegistCameraBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CameraScan(),
    );
  }
}
