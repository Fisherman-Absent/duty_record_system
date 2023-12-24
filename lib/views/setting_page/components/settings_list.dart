import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pref/pref.dart';
import 'package:upgrader/upgrader.dart';

import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/controller/setting_controller.dart';

import 'package:duty_record_system/views/setting_page/components/color.dart';

import 'package:fluttertoast/fluttertoast.dart';

class SettingList extends StatefulWidget {


  @override
  State<SettingList> createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  

  late FToast fToast;
  @override
  Widget build(BuildContext context) {



    
    return PrefPage(
        children: [
          PrefTitle(title: Text('General')),
          PrefDropdown<String>(
            title: Text('語言'),
            pref: 'start_page',
            items: [
              DropdownMenuItem(value: 'Home', child: Text("繁體中文")),
              DropdownMenuItem(value: 'Timeline', child: Text("English")),
              DropdownMenuItem(value: 'Messages', child: Text("French")),
            ],
          ),
          ListTile( title: Text("檢查更新"),
                    onTap: (){
                      Fluttertoast.showToast(
                      msg: "目前已是最新版本",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                      );
                    },
                  ),
          PrefColor(
            title: Text('Preferred color'),
            pref: 'ui_color',
          ),
          PrefDropdown<int>(
            title: Text('Number of items'),
            pref: 'items_count',
            fullWidth: false,
            items: [
              DropdownMenuItem(value: 1, child: Text('One')),
              DropdownMenuItem(value: 2, child: Text('Two')),
              DropdownMenuItem(value: 3, child: Text('Three')),
              DropdownMenuItem(value: 4, child: Text('Four')),
            ],
          ),
          PrefHiderGeneric<int>(
              pref: 'items_count',
              nullValue: 4,
              reversed: true,
              children: [
                PrefLabel(title: Text('Four items selected')),
              ]),
          PrefTitle(title: Text('Personalization')),
          PrefRadio<String>(
            title: Text('System Theme'),
            value: 'system',
            pref: 'ui_theme',
          ),
          PrefRadio<String>(
            title: Text('Light Theme'),
            value: 'light',
            pref: 'ui_theme',
          ),
          PrefRadio(
            title: Text('Dark Theme'),
            value: 'dark',
            pref: 'ui_theme',
          ),
          PrefTitle(title: Text('test')),
          PrefDialog(
              title: Text('Edit description'),
              cancel: Text('Cancel'),
              submit: Text('Save'),
              children: [
                PrefText(
                  label: 'Description',
                  pref: 'user_description',
                  padding: EdgeInsets.only(top: 8.0),
                  autofocus: true,
                  maxLines: 2,
                )
              ],
            ),
          PrefTitle(title: Text('Messaging')),
          PrefPageButton(
            title: Text('Notifications'),
            leading: Icon(Icons.message),
            page: PrefPage(
              cache: true,
              children: [
                PrefTitle(title: Text('New Posts')),
                PrefSwitch(
                  title: Text('New Posts from Friends'),
                  pref: 'notification_newpost_friend',
                ),
                PrefDisabler(
                  pref: 'notification_newpost_friend',
                  reversed: true,
                  children: [
                    PrefTitle(title: Text('Private Messages')),
                    PrefSwitch(
                      title: Text('Private Messages from Friends'),
                      pref: 'notification_pm_friend',
                    ),
                    PrefSwitch(
                      title: Text('Private Messages from Strangers'),
                      pref: 'notification_pm_stranger',
                      onChange: (value) async {
                        debugPrint(
                            'notification_pm_stranger changed to: $value');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          
          
          
          
          PrefTitle(title: Text('Content')),
          
          PrefButton(
            onTap: () => debugPrint('DELETE!'),
            color: Colors.red,
            child: Text('Delete'),
          ),
          PrefTitle(title: Text('More Dialogs')),
          
          
         
        ],
      );
  }
}