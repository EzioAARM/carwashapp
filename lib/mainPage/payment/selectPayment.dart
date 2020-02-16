import 'package:carwashapp/mainPage/payment/cardItem.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:carwashapp/globals.dart' as globals;

class SelectPayment extends StatefulWidget {

  final String cardNum;
  final String cardType;
  final bool cardPriority;
  final String cardDate;
  final String cardName;
  final int paymentId;
  final String codigoQr;
  final String sedeId;

  SelectPayment(
    this.cardNum,
    this.cardType,
    this.cardDate,
    this.cardName,
    this.cardPriority,
    this.paymentId,
    this.codigoQr,
    this.sedeId,
  );

  @override
  SelectPaymentState createState() {
    return SelectPaymentState(
    this.cardNum,
    this.cardType,
    this.cardDate,
    this.cardName,
    this.cardPriority,
    this.paymentId,
    this.codigoQr,
    this.sedeId,
  );
  }
}

class SelectPaymentState extends State<SelectPayment> {

  final String cardNum;
  final String cardType;
  final bool cardPriority;
  final String cardDate;
  final String cardName;
  final int paymentId;
  final String codigoQr;
  final String sedeId;

  SelectPaymentState(
    this.cardNum,
    this.cardType,
    this.cardDate,
    this.cardName,
    this.cardPriority,
    this.paymentId,
    this.codigoQr,
    this.sedeId,
  );

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: () {
        var userid = globals.prefs.getString('userid');
        final channel = IOWebSocketChannel.connect('wss://iib2b26n9c.execute-api.us-east-1.amazonaws.com/test');
        channel.sink.add('{ "codigo": "$codigoQr", "sede":"$sedeId", "userId":"$userid", "idPago":"$paymentId", "action": "lavar" }');
        channel.sink.close();
        Navigator.pop(context);
      },
      child: PaymentItem(cardNum, cardType, cardDate, cardName, cardPriority),
    );
  }

}