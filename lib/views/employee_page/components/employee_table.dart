import 'dart:developer';

import 'package:duty_record_system/views/employee_page/employee_info_page/index.dart';
import 'package:flutter/material.dart';

import '../../../style/colors.dart';

import 'package:duty_record_system/views/employee_page/register_page/index.dart';
import 'package:duty_record_system/database/employee_db.dart';
import 'package:duty_record_system/controller/event_bus.dart';


class EmployeeTable extends StatefulWidget {
  const EmployeeTable({super.key});

  @override
  State<EmployeeTable> createState() => _EmployeeTableState();
}

class _EmployeeTableState extends State<EmployeeTable> {

  @override
  void initState() {
    super.initState();
    getEmployeeList('');
  }
  List<Employee> employeeList = [];

  void getEmployeeList(String keyword) async {
    final list = await EmployeeDB.getEmployees(keyword);
    setState(() {
      employeeList = list;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    eventBus.on<DBEvent>().listen((event) {
      if(event.eventName == 'Reload Table'){
        debugPrint("reload");
        getEmployeeList(event.keyword);
      }
    });
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
            for (var i=0;i<employeeList.length;i++) 
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
                  child:Row(
                    children:[
                      Text(
                        employeeList[i].name,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        ' (',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        employeeList[i].employeeId,
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

                      pageBuilder: (context, animation, secondaryAnimation) =>EmployeeInfoPage(employeeList[i]),  
                      transitionDuration: Duration(milliseconds: 0),

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