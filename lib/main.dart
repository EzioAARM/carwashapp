import 'package:carwashapp/forms/register.dart';
import 'package:carwashapp/forms/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';
    Widget _mainContent = new LoginForm();
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new BottomBarStart(), 
    );
  }
}

class BottomBarStart extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomBarStart> {

  var _curIndex = 0;
  Widget _content = new LoginForm();

  Widget bottomBar() => BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.check),
        title: Text('login'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('registro'),
      ),
    ],
    type: BottomNavigationBarType.fixed,
    currentIndex: _curIndex,
    onTap: (index) {
      setState(() {
        _curIndex = index;
        switch (_curIndex) {
          case 0:
            _content = LoginForm();
            break;
          case 1:
            _content = RegisterForm();
            break;
        }
      });
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      body: _content,
    );
  }

}