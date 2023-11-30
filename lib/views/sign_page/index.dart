import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/colors.dart';
import '../../components/bottomNav.dart';
import './components/workModeSwitch.dart';
import './components/employeeIdInput.dart';
import './components/nameInput.dart';
import '../../controller/signController.dart';

class SignPage extends StatelessWidget {
  SignPage() {
    final signController = SignController();
    Get.put(signController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("簽到"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body:SignBody(),
      bottomNavigationBar: BottomNavComponent(
        selectedIndex: 0, 
      ),
    );
  }
}

class SignBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      child: Column(  
        children: [
          Expanded(
            flex: 20, 
            child: WorkModeSwitch(),
          ),
          Expanded(
            flex: 20, 
            child: EmployeeIdInput(),
          ),
          Expanded(
            flex: 20, 
            child: NameInput(),
          ),
          Expanded(
            flex: 70, 
            child: Text("1"),
          ),
        ],
      )
    );
  }
}

