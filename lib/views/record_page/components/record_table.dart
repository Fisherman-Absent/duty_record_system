import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/colors.dart';
import '../../../controller/regist_controller.dart';

// /Users/yaught/Desktop/sf_test/duty_record_system/lib/database/checkin_db.dart
import 'package:duty_record_system/database/checkin_db.dart';
import 'package:duty_record_system/controller/event_record.dart';

class RecordTable extends StatefulWidget {
  const RecordTable({super.key});

  @override
  State<RecordTable> createState() => _RecordTableState();
}

class _RecordTableState extends State<RecordTable> {
  
  @override
  void initState() {
    super.initState();
    getEmployeeList('','');
  }
  List<CheckIn> employeeList = [];

  void getEmployeeList(String keyword_Name,String keyword_date) async {
    final list = await CheckInDB.getCheckIn(keyword_Name,keyword_date);
    setState(() {
      employeeList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("*********************");
    // print(employeeList.length);
    // print("*********************");

    eventBus.on<DBEvent>().listen((event) {
      if(event.eventName == 'Reload Table_111'){
        debugPrint("reload");
        print("*********************");
        print(event.keyword_Name);
        print(event.keyword_date);
        print("*********************");
        getEmployeeList(event.keyword_Name,event.keyword_date);
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
          for (var number =0; number < employeeList.length; number++)
          TableRow(children: [
                Container(
                  height: 100,
                  color: inputFillColor,
                  child: new Icon(
                    Icons.person,  
                    color: Color.fromARGB(255, 223, 58, 17),
                    size: 30,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left:20),
                  height: 100,
                  color: inputFillColor,
                  alignment: Alignment.centerLeft, //新增
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                        employeeList[number].name + '  ' + '(' + ' '+ employeeList[number].employeeId + ' ' + ")" ,
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                        textAlign: TextAlign.left,

                      ),
                      // if(employeeList[number].onWork)
                      //   Text(
                      //     '上班'+ ' : ' + '2023-12-06 00:00:00.000',
                      //     style: TextStyle(fontSize: 15),
                      //     textAlign: TextAlign.left,
                      //   )
                      // else
                      //   Text(
                      //     '上班'+ ' : ' + '2023-12-06 00:00:00.000',
                      //     style: TextStyle(fontSize: 15),
                      //     textAlign: TextAlign.left,
                      //   ),
                      
                      Text(
                        '上班'+ ' : ' + employeeList[number].time.split("T")[0] + "  " +  employeeList[number].time.split("T")[1],
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '下班'+ ' : ' + employeeList[number].time.split("T")[0] + "  " +  employeeList[number].time.split("T")[1],
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),   
              ],
          )
        ]
      ),
    );
  }
}