import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  
  final _formKey = GlobalKey<FormState>();

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
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    Scaffold.of(context)
                                        .showSnackBar(SnackBar(content: Text('Verificando la informacion')));
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
