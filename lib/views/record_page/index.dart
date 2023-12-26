import 'package:flutter/material.dart';




import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/components/bottom_nav.dart';
import 'package:duty_record_system/components/can_scroll.dart';



import './components/record_table.dart';


class RecordPage extends StatelessWidget {
  const RecordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("點名紀錄"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body:CanScroll(
        Column(
          children: [
            ElevatedButton(
              child: const Text(
                'Date Picker',
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
              ),
              onPressed: () async{
              final result = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020, 01),
                  lastDate: DateTime(2100, 12));
              
              debugPrint(result.toString());
            },
            ),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
                border : OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                fillColor: inputFillColor,
                filled: true,
              ),
              onChanged: (value) {
              
              },
            ),
            const SizedBox(height: 20,),
            const RecordTable(),
          ],
        )
      ),
      bottomNavigationBar: const BottomNavComponent(
        selectedIndex: 1, 
      ),
    );
  }
}