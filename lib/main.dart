import 'package:ez_vistors/Pages/HomePage.dart';
import 'package:ez_vistors/Pages/LoginPage.dart';
import 'package:ez_vistors/Pages/VistoriasPage.dart';
import 'package:ez_vistors/Pages/SobrePage.dart';
import 'package:ez_vistors/Pages/CriarPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    theme: ThemeData(hintColor: Colors.white),
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/home': (context) => HomePage(),
      '/vistorias': (context) => VistoriasPage(),
      '/criar': (context) => CriarPage(),
      '/sobre': (context) => SobrePage(),
    },
  ));
}