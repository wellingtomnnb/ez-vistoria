import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'ListItensPage.dart';
import 'LoginPage.dart';
import 'SobrePage.dart';
import 'VistoriasPage.dart';

class CriarPage extends StatefulWidget {
  @override
  _CriarPageState createState() => _CriarPageState();
}

class _CriarPageState extends State<CriarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Nova Vistoria')),
        drawer: Drawer(
          child: ListView(children: <Widget> [
            DrawerHeader(
              child: Text("Menu"),
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  image: DecorationImage(
                      image: NetworkImage('https://s01.jetimgs.com/trs2SR8vLcluowtNjIWNZFqybLrndFutqc9yZj_xlCtR2hBJIrlJD9ML4drZC6Q5WuP5B6jPb9iy910siVufFOwkPVwAdvxz_Zx0dS8NQ0PqeUfNc3QF/documentos.png')
                  )
              ),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()))
            ),
            ListTile(
                leading: Icon(Icons.check_circle_outline),
                title: Text("Vistorias"),
                onTap: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context) => VistoriasPage()))
            ),
            ListTile(
                leading: Icon(Icons.info_outline),
                title: Text("Sobre"),
                onTap: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context) => SobrePage()))
            ),
            ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text("Sair"),
                onTap: () =>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()))
            )
          ],
          ),
        ),

        body: Center(
            child: Column(
                children: [
                  RaisedButton(
                      child: Text('Inserir Itens'),
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListItensPage()))
                  )

                ])
        ));
  }

}
