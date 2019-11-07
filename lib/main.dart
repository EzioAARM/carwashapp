import 'package:carwashapp/loginPage/loginPage.dart';
import 'package:carwashapp/mainPage/mainPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Main page';
    // Aqui agregar la verificacion cuando se tenga un token jwt
    Widget _content = MainPage();
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: _content, 
    );
  }
}