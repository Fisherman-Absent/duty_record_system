import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/colors.dart';
import '../../components/bottomNav.dart';
import './components/workModeSwitch.dart';
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
        title: Text("Sign Page"),
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
    return Column(  
        children: [
          Expanded(
            flex: 20, 
            child: WorkModeSwitch(),
          ),
        ],
      );
  }
}

