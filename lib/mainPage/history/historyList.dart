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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                margin: new EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    // load items here
                    HistoryItem('sedan', 'lunes', '1123', 55),
                    HistoryItem('suv', 'lunes', '1123', 70)

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  } 
}