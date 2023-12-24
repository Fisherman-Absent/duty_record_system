import 'package:flutter/material.dart';
import 'package:pref/pref.dart';

import 'dart:async';


import 'package:duty_record_system/views/setting_page/components/color.dart';

import '../../../style/colors.dart';

import './about_us.dart';

import 'package:fluttertoast/fluttertoast.dart';

class SettingList extends StatefulWidget {
  //const SettingList({super.key});

  const SettingList(this.service, {Key? key}) : super(key: key);
  final BasePrefService service;

  @override
  State<SettingList> createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  ThemeMode? _brightness;
  Color? _uiColor;

  StreamSubscription<String>? _stream;

  late FToast fToast;
  @override
  Widget build(BuildContext context) {


    // _stream ??= widget.service.stream<String>('ui_theme').listen((event) {
    //   setState(() {
    //     switch (event) {
    //       case 'system':
    //         _brightness = ThemeMode.system;
    //         debugPrint("Setting brightness");
    //         break;
    //       case 'light':
    //         _brightness = ThemeMode.light;
    //         break;
    //       case 'dark':
    //         _brightness = ThemeMode.dark;
    //         break;
    //     }
    //   });
    // });
    
    return PrefPage(
        children: [
          const PrefTitle(title: Text('General')),
          
          ListTile( 
            title: const Text("檢查更新"),
            onTap: (){
              Fluttertoast.showToast(
                msg: "目前已是最新版本",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: appBarBGColor,
                textColor: Colors.black,
                fontSize: 16.0
              );
            },
          ),
          ListTile(
            title: const Text("關於此軟體"),
            onTap: (){
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),
              );
            },
          ),
          // const PrefColor(
          //   title: Text('Preferred color'),
          //   pref: 'ui_color',
          // ),
          const PrefTitle(title: Text('Personalization')),
          const PrefDropdown<String>(
            autofocus: true,
            title: Text('語言'),
            pref: 'language',
            items: [
              DropdownMenuItem(value: 'zh_TW', child: Text("繁體中文")),
              DropdownMenuItem(value: 'en_US', child: Text("English")),
              DropdownMenuItem(value: 'id', child: Text("Indonesian")),
            ],
          ),
          // const PrefRadio<String>(
          //   selected: true,
          //   title: Text('System Theme'),
          //   value: 'system',
          //   pref: 'ui_theme',
          // ),
          // const PrefRadio<String>(
          //   title: Text('Light Theme'),
          //   value: 'light',
          //   pref: 'ui_theme',
          // ),
          // const PrefRadio(
          //   title: Text('Dark Theme'),
          //   value: 'dark',
          //   pref: 'ui_theme',
          // ),
          
          
          
          
          
          
          
          
          
          
         
        ],
      );
  }
}