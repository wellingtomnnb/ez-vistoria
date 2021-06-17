import 'package:ez_vistors/Pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

Color cormain = Color(303336);

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF303336),
        body: Padding(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 250,
                  width: 150,
                  child: Image.asset("img/logo.png"),
                ),
                Container(
                  height: 75,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(50))),
                      labelText: 'usuário',
                    ),
                  ),
                ),
                Container(
                  height: 75,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(50))),
                      labelText: 'senha',
                    ),
                  ),
                ),
                Container(
                    height: 75,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: ElevatedButton(
                      child: Text(
                        'Entrar',
                        style: TextStyle(fontSize: 14),
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.orange[900]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      side: BorderSide(color: Colors.red)))),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                    )),
              ],
            )));
  }
}
