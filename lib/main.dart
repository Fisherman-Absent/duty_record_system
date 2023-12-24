import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pref/pref.dart';
import './routers/routers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'controller/theme_contorller.dart';

import 'package:upgrader/upgrader.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final service = await PrefServiceShared.init(
    defaults: {
      'language': 'zh_TW',
      'ui_theme': 'light',
    },
  );
  await Upgrader.clearSavedSettings();


  runApp(
    PrefService(
      service: service,
      child: 
        MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            /* light theme settings */
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            /* dark theme settings */
          ),
          themeMode: ThemeMode.light,
          localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('zh', 'TW'),
          Locale('en', 'US'),
        ],
        locale: const Locale('zh'),
          initialRoute: '/',
          routes: getRoutes(),
        )
      )
    ); 

}