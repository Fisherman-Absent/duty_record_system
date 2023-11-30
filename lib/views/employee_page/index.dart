import 'package:flutter/material.dart';

import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/components/bottom_nav.dart';
import 'components/regist_btn.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("員工資料"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body:Text("employee"),
      floatingActionButton: RegistBtn(),
      bottomNavigationBar: BottomNavComponent(
        selectedIndex: 2, 
      ),
    );
  }
}