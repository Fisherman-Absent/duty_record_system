import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/colors.dart';
import '../../components/bottom_nav.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("設定"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body:Text("setting"),
      bottomNavigationBar: BottomNavComponent(
        selectedIndex: 3, 
      ),
    );
  }
}