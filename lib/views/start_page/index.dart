import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1),(){
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