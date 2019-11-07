import 'package:flutter/material.dart';

class PaymentItem extends StatefulWidget {
  
  final String cardNum;
  final String cardType;
  final bool cardPriority;
  final String cardDate;
  final String cardName;

  PaymentItem(
    this.cardNum,
    this.cardType,
    this.cardDate,
    this.cardName,
    this.cardPriority,
  );

  @override
  PaymentItemState createState() {
    return PaymentItemState(
    this.cardNum,
    this.cardType,
    this.cardDate,
    this.cardName,
    this.cardPriority,
  );
  }
}

class PaymentItemState extends State<PaymentItem> {

  String cardNum;
  String cardType;
  bool cardPriority;
  String cardDate;
  String cardName;
  Color cardColor = Color.fromRGBO(130, 177, 255, 1);
  String cardTypeName = '';

  PaymentItemState(
    this.cardNum,
    this.cardType,
    this.cardDate,
    this.cardName,
    this.cardPriority,
  ) {
    if (this.cardPriority) {
      cardColor = Colors.lightGreen;
    }
    switch (this.cardType) {
      case '1':
        this.cardTypeName = 'Visa';
        break;
      case '2':
        this.cardTypeName = 'MasterCard';
        break;
      default:
        this.cardTypeName = '';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  this.cardTypeName + ' ' + this.cardNum,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  this.cardName
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  this.cardDate
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  
}