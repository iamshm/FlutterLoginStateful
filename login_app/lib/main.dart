import 'package:flutter/material.dart';
import 'package:login_app/screen/homepage.dart';
import 'package:login_app/screen/loginpage.dart';
import 'package:login_app/screen/signuppage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/landing': (BuildContext context) => MyApp(),
        '/signup': (BuildContext context) => SignUpPage(),
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}
