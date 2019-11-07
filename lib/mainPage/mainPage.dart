import 'package:carwashapp/mainPage/history/historyList.dart';
import 'package:carwashapp/mainPage/profile/profileForm.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Main page';
    // Aqui agregar la verificacion cuando se tenga un token jwt
    Widget _content = ProfileForm();
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: BottomBarStart(), 
    );
  }
}

class BottomBarStart extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomBarStart> {

  var _curIndex = 0;
  Widget _content = new HistoryList();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        tooltip: 'iniciar lavado',
        icon: Icon(Icons.local_car_wash),
        label: Text('lavar'),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('historial')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('profile')
            ),
          ],
          currentIndex: _curIndex,
          onTap: (index) {
            setState(() {
              _curIndex = index;
              switch (_curIndex) {
                case 0:
                  _content = HistoryList();
                  break;
                case 1:
                  _content = ProfileForm();
                  break;
              }
            });
          },
        ),
      ),
      body: _content,
    );
  }

}