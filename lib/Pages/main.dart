import 'file:///C:/Users/Wellington/AndroidStudioProjects/ez_vistors/lib/Pages/LoginPage.dart';
import 'file:///C:/Users/Wellington/AndroidStudioProjects/ez_vistors/lib/Pages/VistoriasPage.dart';
import 'package:ez_vistors/Pages/SobrePage.dart';
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
      '/sobre': (context) => SobrePage(),
    },
  ));
}