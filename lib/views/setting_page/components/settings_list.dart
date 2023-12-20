import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pref/pref.dart';
import 'package:upgrader/upgrader.dart';

import 'package:duty_record_system/style/colors.dart';
import 'package:duty_record_system/controller/setting_controller.dart';

class SettingList extends StatefulWidget {


  @override
  State<SettingList> createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  @override
  Widget build(BuildContext context) {


    // return UpgradeAlert(
    //   child: Scaffold(
    //     appBar: AppBar(title: Text('Upgrader Example')),
    //     body: Center(child: Text('Checking...')),
    //   )
    // );








    
    return PrefPage(
        children: [
          PrefTitle(title: Text('General\ndafsdafsadfsdfsadfsadfsdafsadfasdfsadf')),
          PrefDropdown<String>(
            title: Text('Start Page'),
            pref: 'start_page',
            items: [
              DropdownMenuItem(value: 'Home', child: Icon(Icons.home)),
              DropdownMenuItem(value: 'Timeline', child: Icon(Icons.timeline)),
              DropdownMenuItem(value: 'Messages', child: Icon(Icons.message)),
            ],
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
          PrefIntegerText(
            label: 'Number of items',
            pref: 'items_count_integer',
          ),
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
          PrefButton(
            // child: UpgradeAlert(
            //   child: Scaffold(
            //     appBar: AppBar(title: Text('Upgrader Example')),
            //     body: Center(child: Text('Checking...')),
            //     )
            //   ),
            child: Text('檢查更新'),
                
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
          PrefTitle(title: Text('User')),
          PrefText(
            label: 'Display Name',
            pref: 'user_display_name',
          ),
          PrefText(
            label: 'E-Mail',
            pref: 'user_email',
            validator: (str) {
              if (str == null || !str.endsWith('@gmail.com')) {
                return 'Invalid email';
              }
              return null;
            },
          ),
          PrefButtonGroup<int>(
            title: Text('Gender'),
            pref: 'gender',
            items: [
              ButtonGroupItem(value: 1, child: Text('Male')),
              ButtonGroupItem(value: 2, child: Text('Female')),
              ButtonGroupItem(value: 3, child: Text('Other')),
            ],
          ),
          PrefSlider<int>(
            title: Text('Your age'),
            pref: 'age',
            trailing: (num v) => SizedBox(width: 50, child: Text('I\'m $v')),
            min: 10,
            max: 90,
          ),
          PrefSlider<int>(
            title: Text('Person weight (metric)'),
            subtitle: Text('Demonstrating a long title and wide scale slider'),
            pref: 'weight',
            trailing: (num v) => Text('Weighs $v kilogram'),
            min: 10,
            max: 250,
            direction: Axis.vertical,
          ),
          
          PrefLabel(
            title: Text(
              PrefService.of(context).get<String>('user_description') ?? '',
              style: TextStyle(color: Colors.pink),
            ),
          ),
          
          PrefDialogButton(
            title: Text('Edit description'),
            dialog: PrefDialog(
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
            onPop: () => setState(() {}),
          ),
          PrefTitle(title: Text('Content')),
          PrefDialogButton(
            title: Text('Content Types'),
            dialog: PrefDialog(
              title: Text('Enabled Content Types'),
              cancel: Icon(Icons.cancel),
              submit: Icon(Icons.save),
              children: [
                PrefCheckbox(
                  title: Text('Text'),
                  pref: 'content_show_text',
                ),
                PrefCheckbox(
                  title: Text('Images'),
                  pref: 'content_show_image',
                ),
                PrefCheckbox(
                  title: Text('Music'),
                  pref: 'content_show_audio',
                )
              ],

            ),
          ),
          PrefButton(
            onTap: () => debugPrint('DELETE!'),
            color: Colors.red,
            child: Text('Delete'),
          ),
          PrefTitle(title: Text('More Dialogs')),
          PrefChoice<String>(
            title: Text('Android\'s "ListPreference"'),
            pref: 'android_listpref_selected',
            items: [
              DropdownMenuItem(value: 'select_1', child: Text('Select me!')),
              DropdownMenuItem(value: 'select_2', child: Text('Hello World!')),
              DropdownMenuItem(value: 'select_3', child: Text('Test')),
            ],
            cancel: Text('Cancel'),
          ),
          PrefDialogButton(
            title: Text('Android\'s "ListPreference" with autosave'),
            dialog: PrefDialog(
              title: Text('Select an option'),
              submit: Text('Close'),
              children: [
                PrefRadio(
                  title: Text('Select me!'),
                  value: 'select_1',
                  pref: 'android_listpref_auto_selected',
                ),
                PrefRadio(
                  title: Text('Hello World!'),
                  value: 'select_2',
                  pref: 'android_listpref_auto_selected',
                ),
                PrefRadio(
                  title: Text('Test'),
                  value: 'select_3',
                  pref: 'android_listpref_auto_selected',
                ),
              ],
            ),
          ),
          PrefDialogButton(
            title: Text('Android\'s "MultiSelectListPreference"'),
            dialog: PrefDialog(
              title: Text('Select multiple options'),
              cancel: Text('Cancel'),
              submit: Text('Save'),
              children: [
                PrefCheckbox(
                  title: Text('A enabled'),
                  pref: 'android_multilistpref_a',
                ),
                PrefCheckbox(
                  title: Text('B enabled'),
                  pref: 'android_multilistpref_b',
                ),
                PrefCheckbox(
                  title: Text('C enabled'),
                  pref: 'android_multilistpref_c',
                ),
              ],
            ),
          ),
          PrefTitle(title: Text('Advanced')),
          PrefCheckbox(
            title: Text('Enable Advanced Features'),
            pref: 'advanced_enabled',
            onChange: (value) {
              setState(() {});
              if (!value) {
                PrefService.of(context).set('exp_showos', false);
              }
            },
          ),
          PrefHider(
            pref: 'advanced_enabled',
            children: [
              PrefSwitch(
                title: Text('Show Operating System'),
                pref: 'exp_showos',
                subtitle: Text(
                    'This option shows the users operating system in his profile'),
              )
            ],
          ),
        ],
      );
  }
}