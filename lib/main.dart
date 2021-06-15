import 'package:ez_vistors/LoginPage.dart';
import 'package:ez_vistors/VistoriasPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CriarPage.dart';
import 'HomePage.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(hintColor: Colors.white),
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/home': (context) => HomePage(),
      '/vistorias': (context) => VistoriasPage(),
      '/criar': (context) => CriarPage(),
    },
  ));
}