import 'package:elmaliya/view/login.dart';
import 'package:flutter/material.dart';
import 'package:elmaliya/constant/constant.dart';
import 'package:elmaliya/launcher.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // OneSignal.shared
  //     .init("XXXXXXXXX", iOSSettings: null);
  // OneSignal.shared
  //     .setInFocusDisplayType(OSNotificationDisplayType.notification);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Buku Kuangan Digital",
    home: Launcher(),
    theme: ThemeData(primaryColor: Colors.green[500]),
    routes: <String, WidgetBuilder>{
      SPLASH_SCREEN: (BuildContext context) => Launcher(),
      HOME_SCREEN: (BuildContext context) => Login(),
    },
  ));
}
