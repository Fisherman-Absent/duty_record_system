import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:get/get.dart';

import '../../style/colors.dart';
import '../../components/bottom_nav.dart';
import './components/settings_list.dart';

class SettingPage extends StatefulWidget {

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
        title: Text("設定"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
    body: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SafeArea(
        child: SettingList(),
      ),
    ),
    bottomNavigationBar: BottomNavComponent(
      selectedIndex: 3, 
    ),
  );
}

}

