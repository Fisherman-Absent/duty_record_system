import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../components/bottomNav.dart';
import './components/workModeSwitch.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Page"),
        backgroundColor: appBarBGColor,
        centerTitle: true,
      ),
      body:SignBody(),
      bottomNavigationBar: BottomNavComponent(
        selectedIndex: 0, 
      ),
    );
  }
}

class SignBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(  
        children: [
          Expanded(
            flex: 20, 
            child: WorkModeSwitch(),
          ),
        ],
      );
  }
}

