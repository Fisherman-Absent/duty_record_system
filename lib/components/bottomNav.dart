import 'package:flutter/material.dart';

void handleNavTap(int index, BuildContext context) {
  if(index == 0){
    Navigator.of(context).pushReplacementNamed('/sign');
  }
  else if(index == 1){
    Navigator.of(context).pushReplacementNamed('/record');
  }
  else if(index == 2){
    Navigator.of(context).pushReplacementNamed('/employee');
  }
  else if(index == 3){
    Navigator.of(context).pushReplacementNamed('/setting');
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
