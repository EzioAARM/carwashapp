import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:carwashapp/mainPage/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:carwashapp/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';


class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  
  final _formKey = GlobalKey<FormState>();
  var client = new HttpClient();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: _formKey,
      child: new Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: new Container(
                    margin: new EdgeInsets.all(10.0),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Nombre de usuario',
                                prefixIcon: Icon(Icons.person_outline)
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Ingrese un nombre de usuaro';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Contraseña',
                                prefixIcon: Icon(Icons.vpn_key)
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Ingrese su contraseña';
                                }
                                return null;
                              },
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              alignment: Alignment.centerRight,
                              child: OutlineButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    Scaffold.of(context)
                                        .showSnackBar(
                                          SnackBar(
                                            content: Text('Verificando la informacion'),
                                            duration: Duration(milliseconds: 300,),
                                          )
                                        );
                                    var queryParams = '?username=${usernameController.text}&password=${passwordController.text}';
                                    var response = await http.get('${globals.StageUrl}/login' + queryParams);
                                    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
                                    switch (decodedResponse['statusCode']) {
                                      case 200:
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                                        Scaffold.of(context)
                                          .showSnackBar(
                                            SnackBar(
                                              content: Text('Bienvenido ' + usernameController.text),
                                              duration: Duration(milliseconds: 500,),
                                            )
                                          );
                                        final prefs = await SharedPreferences.getInstance();
                                        prefs.setString('token', decodedResponse['token']);
                                        prefs.setString('username', usernameController.text);
                                        prefs.setString('userid', decodedResponse['userid']);
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                                        break;
                                      case 502:
                                        Scaffold.of(context)
                                          .showSnackBar(
                                            SnackBar(
                                              content: Text('Ocurrio un error en nuestros servidores :c'),
                                              duration: Duration(milliseconds: 1000,),
                                            )
                                          );
                                        break;
                                      case 404:
                                        Scaffold.of(context)
                                          .showSnackBar(
                                            SnackBar(
                                              content: Text('Verifica la informacion que ingresaste'),
                                              duration: Duration(milliseconds: 1000,),
                                            )
                                          );
                                        break;
                                      default:
                                        Scaffold.of(context)
                                          .showSnackBar(
                                            SnackBar(
                                              content: Text('Hubo un error inesperado'),
                                              duration: Duration(milliseconds: 1000,),
                                            )
                                          );
                                        break;
                                    }
                                  }
                                },
                                child: Text("Iniciar sesion"),
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(13, 71, 161, 0.2),
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            2.0,
                            2.0,
                          ),
                        )
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
          decoration: new BoxDecoration(
            color: Color.fromRGBO(238, 238, 238, 1)
          ),
        ),
    );
  }
}
