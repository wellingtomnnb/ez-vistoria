
import 'package:ez_vistors/Pages/HomePage.dart';
import 'package:ez_vistors/Theme/Cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        backgroundColor: Cores.cinza_fundo,
        body: Padding(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
            child: ListView(
              children: <Widget>[
                Container(
                width: 140,
                height: 140,
                child: Icon(
                  Icons.home_work,
                  color: Colors.white,
                  size: 94.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Cores.laranja),
              ),
                Container(
                  height: 75,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white
                    ),
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
                    style: TextStyle(
                        color: Colors.white
                    ),
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
                        _login();
                      },
                    )),
              ],
            )));
  }

  _login() {
    //TODO - COLOCAR REGRA DE LOGIN VIA BANCO DE DADOS AQUI

    if (nameController.text == "admin" && passwordController.text == "admin") {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      _showToast(context, Colors.red);
    }
  }

  void _showToast(BuildContext context, Color cor) {
    Fluttertoast.showToast(
        msg: "Login o senha inválidos",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: cor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
