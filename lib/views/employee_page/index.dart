import 'package:flutter/material.dart';

import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/components/bottom_nav.dart';
import './components/regist_btn.dart';
import './components/employee_table.dart';

import 'package:duty_record_system/components/can_scroll.dart';

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
      body:CanScroll(Column(
        children: [
          SizedBox(height: 20,),
          TextFormField(
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 2),
            border : OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0)
            ),
            fillColor: inputFillColor,
            filled: true,
          ),
          onChanged: (value) {
            
          },
        ),
        SizedBox(height: 20,),
        EmployeeTable(),],
      )
        
      ),
      floatingActionButton: RegistBtn(),
      bottomNavigationBar: BottomNavComponent(
        selectedIndex: 2, 
      ),
    );
  }
}