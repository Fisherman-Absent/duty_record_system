import 'package:flutter/material.dart';
import './routers/routers.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: getRoutes(),
  )); 
}