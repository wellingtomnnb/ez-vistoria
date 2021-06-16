import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Item')),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
        ),
        body: Center(
          child: Text('AQUI DEVE EXIBIR O UM FORMULÁRIO PARA INSERIR AS CARACTERISTICAS DO ITEM'),
        )
    );
  }
}
