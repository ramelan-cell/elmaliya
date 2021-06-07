import 'package:elmaliya/view/login.dart';
import 'package:flutter/material.dart';
import 'package:elmaliya/constant/constant.dart';
import 'package:elmaliya/launcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Elmaliya",
    home: Launcher(),
    theme: ThemeData(primaryColor: Colors.green[500]),
    routes: <String, WidgetBuilder>{
      SPLASH_SCREEN: (BuildContext context) => Launcher(),
      HOME_SCREEN: (BuildContext context) => Login(),
    },
  ));
}
