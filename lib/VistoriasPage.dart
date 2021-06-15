import 'package:ez_vistors/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VistoriasPage extends StatefulWidget {
  @override
  _VistoriasPageState createState() => _VistoriasPageState();
}

class _VistoriasPageState extends State<VistoriasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vistorias'),
      ),
      body: Center(
        child: Text('AQUI DEVE EXIBIR O HISTÓRICO DE VISTORIAS'),
        )
    );
  }
}
