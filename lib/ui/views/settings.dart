import 'package:compileanywhere/ui/widgets/background_box.dart';
import 'package:compileanywhere/ui/widgets/localwidgets.dart';
import 'package:compileanywhere/ui/widgets/long_button.dart';
import 'package:compileanywhere/ui/widgets/transparentappbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '../../ui/theme/app_state.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  checkAuthentication() {
    _auth.onAuthStateChanged.listen((user) async {
      if (user == null) {
        
        // Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, '/intro');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppState appState = Hive.box('appStateBox').get('appState');

    return BackgroundBox(
      appBar: TransparentAppBar(
        title: "Settings",
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: <Widget>[
            SizedBoxPadding(),
            LongButton(
              title: "Dark mode",
              onPressed: () {},
              useIcon: false,
              value: appState.isDarkModeOn,
              onChanged: (booleanValue) {
                appState.updateTheme(booleanValue);
                Hive.box('appStateBox').put('appState', appState);
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            
          ],
        ),
      ),
    );
  }
}
