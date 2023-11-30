import 'package:flutter/material.dart';

import '../views/sign_page/index.dart';
import '../views/record_page/index.dart';
import '../views/employee_page/index.dart';
import '../views/setting_page/index.dart';

void handleNavTap(int index, BuildContext context) {
  if(index == 0){
    //Navigator.of(context).pushReplacementNamed('/sign');
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SignPage(),  
        transitionDuration: Duration(milliseconds: 0),
      ),  
    );
  }
  else if(index == 1){
    //Navigator.of(context).pushReplacementNamed('/record');
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => RecordPage(),  
        transitionDuration: Duration(milliseconds: 0),
      ),  
    );
  }
  else if(index == 2){
    //Navigator.of(context).pushReplacementNamed('/employee');
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => EmployeePage(),  
        transitionDuration: Duration(milliseconds: 0),
      ),  
    );
  }
  else if(index == 3){
    //Navigator.of(context).pushReplacementNamed('/setting');
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SettingPage(),  
        transitionDuration: Duration(milliseconds: 0),
      ),  
    );
  }
}

class BottomNavComponent extends StatelessWidget {

  final int selectedIndex;

  BottomNavComponent({
    required this.selectedIndex, 
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => handleNavTap(index, context),  
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      items: [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Center(
        child: Text("This is new route page"),  
      ),
    );
  }
}