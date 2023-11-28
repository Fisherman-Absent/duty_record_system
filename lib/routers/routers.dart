import 'package:flutter/material.dart';

import '../views/start_page/index.dart';
import '../views/sign_page/index.dart';
import '../views/record_page/index.dart';
import '../views/employee_page/index.dart';
import '../views/setting_page/index.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (context) => StartPage(),
    '/sign': (context) => SignPage(),
    '/record': (context) => RecordPage(),
    '/employee': (context) => EmployeePage(),
    '/setting': (context) => SettingPage(),
  }; 
}