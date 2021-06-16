import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ListItensPage.dart';

class CriarPage extends StatefulWidget {
  @override
  _CriarPageState createState() => _CriarPageState();
}

class _CriarPageState extends State<CriarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Nova Vistoria')),
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
