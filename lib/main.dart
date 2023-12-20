import 'package:flutter/material.dart';
import './routers/routers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MaterialApp(
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
  )); 
}