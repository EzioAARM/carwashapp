import 'package:flutter/material.dart';
import 'package:carwashapp/mainPage/history/historyItem.dart';

class HistoryList extends StatefulWidget {
  @override
  HistoryListState createState() {
    return HistoryListState();
  }
}

class HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Color.fromRGBO(238, 238, 238, 1)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: ListView(
          padding: const EdgeInsets.all(25.0),
          children: <Widget>[
            HistoryItem('sedan', 'lunes', '1123', 55),
            HistoryItem('suv', 'lunes', '1123', 70)
          ],
        ),
      ),
    );
  } 
}