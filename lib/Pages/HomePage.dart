import 'dart:convert';

import 'package:ez_vistors/Pages/CriarPage.dart';
import 'package:ez_vistors/Pages/VistoriasPage.dart';
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
      appBar: AppBar(title: Text('Home'), backgroundColor: Colors.orange[900],),
      drawer: Drawer(
        child: ListView(children: <Widget> [
          DrawerHeader(
            child: Text("Menu"),
            decoration: BoxDecoration(color: Colors.grey[350]),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Item1"),
            onTap: () {},
          )
        ],
        ),
      ),
      body: Container(
        color: Colors.grey[900],
        child: ListView(
            children: <Widget>[
              Container(
                width: 200,
                height: 130,
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.add_box),
                        title: Text("Nova Vistoria"),
                        onTap: () {showDialog (context: context, builder: (context) {
                          return AlertDialog(
                              title: Text("Nova Vistoria"),
                              content: Text("Tipo de Vistoria"),
                              actions: [FlatButton(
                                  child: Text("Entrada"),
                                  onPressed: () => Navigator.of(context).pushReplacement (
                                      MaterialPageRoute( builder: (context) => CriarPage()))
                              ),
                                FlatButton(
                                    child: Text("Saída"),
                                    onPressed: () => Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) => CriarPage()))
                                ),
                              ]
                          );
                        },
                        );
                        }
                    ),
                  ],
                ),
              ),

              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.add_box),
                      title: Text("Última Vistoria"),
                      onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => VistoriasPage()));},
                    ),
                  ],
                ),
              ),

              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.add_box),
                      title: Text("Vistoriaa Off-line"),
                      onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));},
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.add_box),
                      title: Text("Vistoriaa On-line"),
                      onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));},
                    )
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }

}




// body: Center(
//           child: Column(
//              children: [
//                 RaisedButton(
//                     child: Text('Vistorias'),
//                     onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => VistoriasPage()))
//                 ),
//                 RaisedButton(
//                     child: Text('Criar Vistoria'),
//                     onPressed: () {
//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: Text("Nova Vistoria"),
//                               content: Text("Tipo de Vistoria"),
//                               actions: [
//                                 FlatButton(
//                                     child: Text("Entrada"),
//                                     onPressed: () =>
//                                         Navigator.of(context).pushReplacement(
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     CriarPage()))

//                                 ),
//                                 FlatButton(
//                                     child: Text("Saída"),
//                                     onPressed: () =>
//                                         Navigator.of(context).pushReplacement(
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     CriarPage()))

//                                 ),
//                               ]

//                             );
//                           }
//                 );}),
//                 RaisedButton(
//                 child: Text('sair'),
//                 onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()))
//                 )
//              ]
//           )
//        )