import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'login_screen.dart';
import 'dashboard.dart';
import 'form_creator.dart';
import 'form_fill.dart';
import 'decortest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "/SplashScreen": (BuildContext context) => new SplashScreen(),
        "/LoginScreen": (BuildContext context) => new LoginScreen(),
        "/DashboardScreen": (BuildContext context) => new DashboardScreen(),
        "/FormCreatorScreen": (BuildContext context) => new FormCreatorScreen(),
        "/FormFillerScreen": (BuildContext context) => new FormFillerScreen(),
        "/FormFill": (BuildContext context) => new RegisterMap(),
      },
    );
  }
}
