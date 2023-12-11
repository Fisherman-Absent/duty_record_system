import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/colors.dart';
import '../../../controller/regist_controller.dart';

class EmployeeTable extends StatefulWidget {
  const EmployeeTable({super.key});

  @override
  State<EmployeeTable> createState() => _EmployeeTableState();
}

class _EmployeeTableState extends State<EmployeeTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Table(
          columnWidths: const<int,TableColumnWidth>{
            0:FlexColumnWidth(1),
            1:FlexColumnWidth(4),
          },
          border: TableBorder.all( color: Colors.black,style: BorderStyle.solid),
          children: [
            // TableRow(
            //   children: <Widget>[
            //       Text(" "),Text("姓名"),Text("船員ID"),
                
            //   ]
            // ),
            for (var i=0;i<10;i++) 
            TableRow(
              children: <Widget>[
                Container(
                  height: 60,
                  color: inputFillColor,
                  child: new Icon(
                    Icons.person,  
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Container(
                  height: 60,
                  color: inputFillColor,
                  child: Center(child:new Text('645'),) ,
                )
              ],
            )
          ]
        ),
      );
  }
}