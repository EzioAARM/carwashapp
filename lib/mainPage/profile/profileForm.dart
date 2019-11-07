import 'package:carwashapp/loginPage/loginPage.dart';
import 'package:carwashapp/mainPage/payment/cardItem.dart';
import 'package:carwashapp/mainPage/payment/paymentForm.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  @override
  ProfileFormState createState() {
    return ProfileFormState();
  }
}

class ProfileFormState extends State<ProfileForm> {

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            color: Color.fromRGBO(238, 238, 238, 1)
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: new Container(
                    margin: new EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Card(
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Image.asset(
                                    'assets/images/defaultProfileImage.png',
                                    width: 125,
                                    height: 125,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 35.0),
                                    child: Text(
                                      'EzioA',
                                      style: TextStyle(
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 35.0),
                                  child: Text(
                                    'Axel Alejandro Rodriguez Montenegro',
                                    style: TextStyle(
                                      fontSize: 16
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 35.0),
                                  child: Text(
                                    'alejandrom9712@gmail.com',
                                    style: TextStyle(
                                      fontSize: 16
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 35.0),
                                  child: OutlineButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                    },
                                    child: Text('Cerrar sesion'),
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: Text(
                                      'Metodos de pago',
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                PaymentItem('1123', '1', '03/23', 'Axel Rodriguez', false),
                                PaymentItem('1123', '2', '03/23', 'Axel Rodriguez', false),
                                PaymentItem('1123', '1', '03/23', 'Axel Rodriguez', false),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  alignment: Alignment.centerRight,
                                  child: OutlineButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentForm()));
                                      /*if (_formKey.currentState.validate()) {
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(content: Text('Verificando la informacion')));
                                      }*/
                                    },
                                    child: Text("Agregar tarjeta"),
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

}