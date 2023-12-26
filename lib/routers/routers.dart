import 'package:flutter/material.dart';

import 'package:duty_record_system/views/start_page/index.dart';
import 'package:duty_record_system/views/sign_page/index.dart';
import 'package:duty_record_system/views/record_page/index.dart';
import 'package:duty_record_system/views/employee_page/index.dart';
import 'package:duty_record_system/views/setting_page/index.dart';


import 'package:pref/pref.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (context) => StartPage(),
    '/sign': (context) => SignPage(),
    '/record': (context) => RecordPage(),
    '/employee': (context) => EmployeePage(),
    '/setting': (context) =>  SettingPage(),
  }; 
}