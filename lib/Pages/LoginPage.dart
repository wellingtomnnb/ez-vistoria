import 'package:ez_vistors/Pages/HomePage.dart';
import 'package:ez_vistors/Pages/SobrePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children:[ RaisedButton(
          child: Text('Entrar'),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        RaisedButton(
          child: Text('Sobre'),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SobrePage())
            );
          }
      )]

      ),
    );
  }
}
