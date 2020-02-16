import 'dart:io';
import 'package:carwashapp/globals.dart' as globals;
import 'package:carwashapp/loginPage/loginPage.dart';
import 'package:carwashapp/mainPage/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  globals.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Widget _content = LoginPage();

  verificarToken() async {
    if (globals.prefs.getString('token') == null) {
      _content = LoginPage();
    } else {
      _content = MainPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Main page';
    verificarToken();
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _content, 
    );
  }
}