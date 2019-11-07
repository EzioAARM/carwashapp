import 'package:flutter/material.dart';

class HistoryItem extends StatefulWidget {
  
  final String carType;
  final double amount;
  final String dateService;
  final String usedCard;

  HistoryItem(
    this.carType,
    this.dateService,
    this.usedCard,
    this.amount
  );

  @override
  HistoryItemState createState() {
    return HistoryItemState(
      this.carType,
      this.dateService,
      this.usedCard,
      this.amount
    );
  }
}

class HistoryItemState extends State<HistoryItem> {

  String carType;
  double amount;
  String dateService;
  String usedCard;
  String imgURL;

  HistoryItemState(
    this.carType,
    this.dateService,
    this.usedCard,
    this.amount
  ) {
    if (this.carType == 'suv') {
      this.imgURL = 'assets/images/car_suv.png';
    } else if(this.carType == 'hatchback') {
      this.imgURL = 'assets/images/car_hatchback.png';
    } else {
      this.imgURL = 'assets/images/car_sedan.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage(this.imgURL),
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              this.carType,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(this.dateService),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Q.' + this.amount.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
                Text('*** ' + this.usedCard),
              ],
            )
          ],
        ),
      ),
    );
  }
  
}