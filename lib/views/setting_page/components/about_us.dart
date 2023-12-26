import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:get/get.dart';

import '../../../style/colors.dart';
import '../../../components/bottom_nav.dart';
import '../../../components/can_scroll.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return CanScroll(
      Scaffold(
        appBar: AppBar(
          title: Text("關於此軟體"),
          backgroundColor: appBarBGColor,
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Text(style:TextStyle(fontSize: 20),
                      "版本：v1.0\n\n\n"
                      "IOS版本：17.0.1\n\n\n"
                      "製作者：中正大學資工三  郭禮德\n"
                      "                                        蘇靖淵\n"
                      "                                        王辰洋\n"
                      "                                        丁皓恩\n"
                      "                                        莊翔亦\n"
                      "                                        林秉燁\n"
                      "                                        張秉棋\n"),
        ),
      )
    );
  }
}