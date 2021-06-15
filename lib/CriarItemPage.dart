import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CriarItemPage extends StatefulWidget {
  @override
  _CriarItemPageState createState() => _CriarItemPageState();
}

class _CriarItemPageState extends State<CriarItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Criar Item')),
        body: Center(
            child: Text('AQUI DEVE EXIBIR um FORMULÁRIO PARA CRIAR UM NOVO ITEM'),
    ));
  }
}
