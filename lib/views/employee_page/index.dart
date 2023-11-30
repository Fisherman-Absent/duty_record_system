import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/colors.dart';
import '../../components/bottomNav.dart';

import 'components/registBtn.dart';

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