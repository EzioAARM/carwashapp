import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Main page';
    // Aqui agregar la verificacion cuando se tenga un token jwt
    Widget _content = null;
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: _content, 
    );
  }
}