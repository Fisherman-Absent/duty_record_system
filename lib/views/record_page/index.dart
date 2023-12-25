import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';



import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/components/bottom_nav.dart';
import 'package:duty_record_system/components/can_scroll.dart';



import './components/record_table.dart';
import 'package:duty_record_system/controller/event_record.dart';

class RecordPage extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState(); 
}

class _RecordPageState extends State<RecordPage> {
  DateTime selecteDate = DateTime.now();

  final firstDate = DateTime(2020, 01);
  final lastDate  = DateTime(2030, 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("點名紀錄"),
        backgroundColor: appBarBGColor,
        centerTitle: true, 
      ),
  
      body:Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: CanScroll(Column(
          children: [
            // ElevatedButton(
            //   child: Text(
            //     '$selecteDate'.split(' ')[0],
            //     style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 235, 129, 9)),
            //   ),
            //   onPressed:() => _openDatePicker(context),

            //   // debugPrint(result.toString());
            // // },
            // ),

            const SizedBox(height: 20,),

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
                  eventBus.fire(DBEvent('Reload Table_111', value, ""));
                },
              ),
            
            const SizedBox(height: 20,),

            ElevatedButton(
              child: Text(
                '$selecteDate'.split(' ')[0],
                style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 235, 129, 9)),
              ),
              onPressed:() => _openDatePicker(context),

              // debugPrint(result.toString());
            // },
            ),

            const SizedBox(height: 20,),

            RecordTable(), // 資料庫串接
          ]
        )
        )
      ),
      bottomNavigationBar: BottomNavComponent(
        selectedIndex: 1, 
      ),
    );
  }

  _openDatePicker(BuildContext context) async {
    final DateTime? date =  await showDatePicker(
      context: context, 
      initialDate: selecteDate,
      firstDate: firstDate, 
      lastDate: lastDate
    );

    // print('selecteDate $selecteDate');
    if(date != null){   // no change date
      setState(() {
        selecteDate = date;
      });  
    }

  
    eventBus.fire(DBEvent('Reload Table_111', "",'$selecteDate'.split(' ')[0]) );


    print('Date $date');
    print('$selecteDate'.split(' ')[0]);
    // print('selecteDate $selecteDate');    
  }   
}