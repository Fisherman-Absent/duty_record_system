import 'package:flutter/material.dart';

import 'package:duty_record_system/views/sign_page/index.dart';
import 'package:duty_record_system/views/record_page/index.dart';
import 'package:duty_record_system/views/employee_page/index.dart';
import 'package:duty_record_system/views/setting_page/index.dart';


import 'package:pref/pref.dart';

void handleNavTap(int index, BuildContext context) {
  if(index == 0){
    //Navigator.of(context).pushReplacementNamed('/sign');
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SignPage(),  
        transitionDuration: const Duration(milliseconds: 0),
      ),  
    );
  }
  else if(index == 1){
    //Navigator.of(context).pushReplacementNamed('/record');
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => RecordPage(),  
        transitionDuration: const Duration(milliseconds: 0),
      ),  
    );
  }
  else if(index == 2){
    //Navigator.of(context).pushReplacementNamed('/employee');
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => EmployeePage(),  
        transitionDuration: const Duration(milliseconds: 0),
      ),  
    );
  }
  else if(index == 3){
    //Navigator.of(context).pushReplacementNamed('/setting');
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>  SettingPage(),  
        transitionDuration: const Duration(milliseconds: 0),
      ),  
    );
  }
}

class BottomNavComponent extends StatelessWidget {

  final int selectedIndex;

  const BottomNavComponent({super.key, 
    required this.selectedIndex, 
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => handleNavTap(index, context),  
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_turned_in),
          label: '簽到' 
        ),
        BottomNavigationBarItem(
           icon: Icon(Icons.assignment),
           label: '點名紀錄' 
        ),
        BottomNavigationBarItem(
           icon: Icon(Icons.assignment_ind),
           label: '員工資料' 
        ),
        BottomNavigationBarItem(
           icon: Icon(Icons.settings),
           label: '設定' 
        ),
      ]
    );
  }
}


class NewRoute extends StatelessWidget {
  const NewRoute({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Route"),
      ),
      body: const Center(
        child: Text("This is new route page"),  
      ),
    );
  }
}