import 'package:flutter/material.dart';

import 'package:duty_record_system/views/employee_page/register_page/index.dart';

class RegistBtn extends StatefulWidget {
  const RegistBtn({super.key});

  @override
  State<RegistBtn> createState() => _RegistBtnState();
}

class _RegistBtnState extends State<RegistBtn> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
            PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>RegisterPage(),  
            transitionDuration: const Duration(milliseconds: 0),
            ),  
          );
        },
        tooltip: 'Regist',
        child: const Icon(Icons.add),
      ); // This trai;
  }
}