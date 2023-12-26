import 'package:flutter/material.dart';

import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/components/bottom_nav.dart';
import './components/regist_btn.dart';
import './components/employee_table.dart';

import 'package:duty_record_system/components/can_scroll.dart';
import 'package:duty_record_system/controller/event_bus.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("員工資料"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),

      body:Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: CanScroll(Column(
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
                  eventBus.fire(DBEvent('Reload Table', value));
                },
              ),
              SizedBox(height: 20,),
              EmployeeTable(),
            ],
          ),
        )
      ),
      floatingActionButton: const RegistBtn(),
      bottomNavigationBar: const BottomNavComponent(
        selectedIndex: 2, 
      ),
    );
  }
}