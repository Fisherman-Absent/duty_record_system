import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/colors.dart';
import '../../components/bottom_nav.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("點名紀錄"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body:Text("record"),
      bottomNavigationBar: BottomNavComponent(
        selectedIndex: 1, 
      ),
    );
  }
}