import 'package:carwashapp/mainPage/history/historyList.dart';
import 'package:carwashapp/mainPage/profile/profileForm.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
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

  showAlertDialog(BuildContext context, String data) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text(data),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          tooltip: 'iniciar lavado',
          icon: Icon(Icons.local_car_wash),
          label: Text('lavar'),
          onPressed: () {
            Future<String> futureString = new QRCodeReader().scan();
            futureString.then((value) {
              var unixTime = value.split(',')[0];
              var sede = value.split(',')[1];
              final channel = IOWebSocketChannel.connect('wss://iib2b26n9c.execute-api.us-east-1.amazonaws.com/test');
              channel.sink.add('{ "codigo": "$unixTime", "sede":"$sede", "userId":"1", "idPago":"1", "action": "lavar" }');
              channel.sink.close();
            });
            
          },
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
      ),
      onWillPop: () {
        return new Future(() => false);
      },
    );
  }

}