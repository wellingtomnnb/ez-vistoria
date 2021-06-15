import 'package:ez_vistors/CriarItemPage.dart';
import 'package:ez_vistors/ItemPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItensPage extends StatefulWidget {
  @override
  _ListItensPageState createState() => _ListItensPageState();
}

class _ListItensPageState extends State<ListItensPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Selecionar Item')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CriarItemPage())),
          child: Icon(Icons.add),
        ),
        body: Center(
            child: Column(
                children: [
                  RaisedButton(
                      child: Text('ITEM 1'),
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemPage()))
                  )
                ])
        ));
  }
}
