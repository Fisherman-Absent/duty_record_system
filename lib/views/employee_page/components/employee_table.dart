import 'package:duty_record_system/views/employee_page/employee_info_page/index.dart';
import 'package:flutter/material.dart';

import '../../../style/colors.dart';




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
            TableRow(children: [
              Container(
                height: 60,
                color: inputFillColor,
                child: const Icon(
                  Icons.person,  
                  color: Colors.green,
                  size: 30,
                ),
              ),
              TableRowInkWell(
                child:Container(
                  padding: const EdgeInsets.only(left:20),
                  height: 60,
                  color: inputFillColor,
                  child:const Row(
                    children:[
                      Text(
                        '645',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '(',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'T123456789',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        ')',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ) ,
              // HERE IT IS...
              
                onTap: (){
                  Navigator.push(context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>EmployeeInfoPage(),  
                      transitionDuration: const Duration(milliseconds: 0),
                    )
                  );
                },
                
              ),
     
              
            ]),
          ]
        ),
      );
  }
}