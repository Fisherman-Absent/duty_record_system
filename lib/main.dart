import 'package:flutter/material.dart';
import 'package:pref/pref.dart';
import './routers/routers.dart';

import 'package:upgrader/upgrader.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final service = await PrefServiceShared.init(
    defaults: {
      'start_page': 'posts',
      'ui_theme': 'light',
    },
  );
  await Upgrader.clearSavedSettings();


  runApp(
    PrefService(
      child: 
        MaterialApp(
          initialRoute: '/',
          routes: getRoutes(),
        ),
      service: service
      )
    ); 
}