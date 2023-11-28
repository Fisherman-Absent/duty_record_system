import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, "/sign");  
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Start Page"),
        centerTitle: true,
      ),
    );
  }
}