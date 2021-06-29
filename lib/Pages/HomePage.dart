import 'package:ez_vistors/Pages/CriarPage.dart';
import 'package:ez_vistors/Pages/DadosdoImovel.dart';
import 'package:ez_vistors/Pages/VistoriasPage.dart';
import 'package:ez_vistors/Theme/Cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'SobrePage.dart';

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
            decoration: BoxDecoration(
                color: Colors.grey[350],
                image: DecorationImage(
                    image: NetworkImage('https://www.jetimob.com/blog/wp-content/uploads/2021/04/Jetimob-post-vistoria-imoveis-672x378.png')
                )
            ),
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

      body: Container(
        color: Colors.grey[900],
        child: InkWell(
        child: ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Container(
                width: 200,
                height: 130,
              ),
              Card(
                color: Cores.laranja,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.add_box,color: Cores.texto_branco,),
                        title: Text("Nova Vistoria",style: TextStyle(color: Cores.texto_branco),),
                        onTap: () {showDialog (context: context, builder: (context) {
                          return AlertDialog(
                              title: Text("Nova Vistoria"),
                              content: Text("Tipo de Vistoria"),
                              actions: [FlatButton(
                                  child: Text("Entrada"),
                                  onPressed: () => Navigator.of(context).pushReplacement (
                                      MaterialPageRoute( builder: (context) => DadosdoImovel()))
                              ),
                                FlatButton(
                                    child: Text("Saída"),
                                    onPressed: () => Navigator.of(context).pushReplacement(
                                        MaterialPageRoute( builder: (context) => DadosdoImovel()))
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
                color: Cores.laranja,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.paste, color: Cores.texto_branco,),
                      title: Text("Minhas Vistorias",style: TextStyle(color: Cores.texto_branco),),
                      onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => VistoriasPage()));},
                    ),
                  ],
                ),
              ),

              Card(
                color: Cores.laranja,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.cloud_off,color: Cores.texto_branco,),
                      title: Text("Vistoriaa Off-line",style: TextStyle(color: Cores.texto_branco)),
                      onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VistoriasPage()));},
                    )
                  ],
                ),
              ),
              Card(
                color: Cores.laranja,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.cloud,color: Cores.texto_branco,),
                      title: Text("Vistoriaa On-line",style: TextStyle(color: Cores.texto_branco)),
                      onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VistoriasPage()));},
                    )
                  ],
                ),
              ),
            ]
        ),
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