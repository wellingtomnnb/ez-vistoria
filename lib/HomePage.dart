import 'dart:convert';

import 'package:ez_vistors/CriarPage.dart';
import 'package:ez_vistors/VistoriasPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class HomePage extends StatefulWidget {

  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Home')),
       body: Center(
          child: Column(
             children: [
                RaisedButton(
                    child: Text('Vistorias'),
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => VistoriasPage()))
                ),
                RaisedButton(
                    child: Text('Criar Vistoria'),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Nova Vistoria"),
                              content: Text("Tipo de Vistoria"),
                              actions: [
                                FlatButton(
                                    child: Text("Entrada"),
                                    onPressed: () =>
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CriarPage()))

                                ),
                                FlatButton(
                                    child: Text("Saída"),
                                    onPressed: () =>
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CriarPage()))

                                ),
                              ]

                            );
                          }
                );}),
                RaisedButton(
                child: Text('sair'),
                onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()))
                )
             ])
       ));
   }

}



