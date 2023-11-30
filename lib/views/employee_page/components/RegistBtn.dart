import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/colors.dart';
import '../../../controller/signController.dart';

import '../register_page/index.dart';


class RegistBtn extends StatefulWidget {

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
            transitionDuration: Duration(milliseconds: 0),
            ),  
          );
        },
        tooltip: 'Regist',
        child: const Icon(Icons.add),
      ); // This trai;
  }
}