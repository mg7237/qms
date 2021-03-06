import 'dart:async';

import 'package:qms/util/preference_connector.dart';
import 'package:qms/providers/theme_manager.dart';
import 'package:qms/util/constants.dart';
import 'package:qms/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qms/util/globals.dart' as globals;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var scaffoldState = GlobalKey<ScaffoldState>();
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    bool loggedBefore =
        await PreferenceConnector().getBool(PreferenceConnector.LOGGED_BEFORE);
    if (!loggedBefore) {
      PreferenceConnector().setBool(PreferenceConnector.LOGGED_BEFORE, true);
    }
    String themeData = await PreferenceConnector()
        .getString(PreferenceConnector.THEME_SELECTED);
    if (themeData != '') {
      globals.theme = themeData;
    } else {
      final Brightness brightnessValue =
          MediaQuery.of(context).platformBrightness;
      bool isDark = brightnessValue == Brightness.dark;
      if (isDark) {
        globals.theme = 'DARK';
      } else {
        globals.theme = 'LIGHT';
      }
      PreferenceConnector()
          .setString(PreferenceConnector.THEME_SELECTED, globals.theme);
    }
    Navigator.pushReplacementNamed(context, LOGIN);
    //Navigator.pushReplacementNamed(context, HOME_PAGE);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldState,
      body: new Center(
        child:
            Hero(tag: "logo", child: Image.asset("assets/icon/login_logo.png")),
      ),
    );
  }
}
