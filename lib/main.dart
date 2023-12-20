import 'package:flutter/material.dart';
import 'package:pref/pref.dart';
import './routers/routers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


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
          localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('zh', 'TW'),
          const Locale('en', 'US'),
        ],
        locale: const Locale('zh'),
          initialRoute: '/',
          routes: getRoutes(),
        ),
      service: service
      )
    ); 

}