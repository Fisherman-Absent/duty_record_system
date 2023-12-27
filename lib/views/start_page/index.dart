import 'package:flutter/material.dart';
import 'package:duty_record_system/database/init_data.dart';


class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1),(){
      initData();
      Navigator.pushReplacementNamed(context, "/sign");  
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Start Page"),
        centerTitle: true,
      ),
    );
  }
}