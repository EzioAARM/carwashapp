import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:carwashapp/globals.dart' as globals;

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  
  final _formKey = GlobalKey<FormState>();

  TextEditingController nombreController = new TextEditingController();
  TextEditingController apellidoController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController correoController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordVerifyController = new TextEditingController();
  var client = new HttpClient();

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
                              controller: nombreController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Nombre',
                                prefixIcon: Icon(Icons.face)
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Ingrese su nombre';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: apellidoController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Apellido',
                                prefixIcon: Icon(Icons.person_outline)
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Ingrese su apellido';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Nombre de usuario',
                                prefixIcon: Icon(Icons.account_circle)
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Ingrese un nombre de usuaro';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: correoController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Correo electronico',
                                prefixIcon: Icon(Icons.mail_outline)
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Ingrese un correo electronico';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
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
                                  return 'Elija una contraseña';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: passwordVerifyController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Contraseña',
                                prefixIcon: Icon(Icons.lock_outline)
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Verifique su contraseña';
                                } else if (passwordController.text != passwordVerifyController.text) {
                                  Scaffold.of(context)
                                    .showSnackBar(
                                      SnackBar(
                                        content: Text('Las contraseñas deben coincidir'),
                                      )
                                    );
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
                                    var dataToSend = '{\"nombre\": \"${nombreController.text}\",\"apellido\": \"${apellidoController.text}\",\"username\": \"${usernameController.text}\",\"email\": \"${correoController.text}\",\"password\": \"${passwordController.text}\"}';
                                    var response = await http.post('${globals.StageUrl}/login', body: dataToSend);
                                    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
                                    switch (decodedResponse['statusCode']) {
                                      case 200:
                                        Scaffold.of(context)
                                          .showSnackBar(
                                            SnackBar(
                                              content: Text('Registrado con exito'),
                                              action: SnackBarAction(
                                                label: 'iniciar sesion',
                                                onPressed: () {

                                                },
                                              ),
                                            )
                                          );
                                        break;
                                      case 409:
                                        Scaffold.of(context)
                                          .showSnackBar(SnackBar(content: Text('El usuario que intenta registrar ya existe')));
                                        break;
                                      default:
                                        Scaffold.of(context)
                                          .showSnackBar(SnackBar(content: Text('Se produjo un error inesperado')));
                                        break;
                                    }
                                  }
                                },
                                child: Text("Registrarme"),
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
