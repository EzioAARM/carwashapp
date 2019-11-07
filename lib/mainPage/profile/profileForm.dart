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
    return new Container(
      decoration: new BoxDecoration(
        color: Color.fromRGBO(238, 238, 238, 1)
      ),
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
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'username'
                          ),
                          enabled: false,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'nombre'
                          ),
                          enabled: false,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'apellido'
                          ),
                          enabled: false,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'correo electronico'
                          ),
                          enabled: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}