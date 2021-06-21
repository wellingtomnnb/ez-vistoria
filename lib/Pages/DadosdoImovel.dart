
import 'package:ez_vistors/Pages/CriarPage.dart';
import 'package:ez_vistors/Pages/VistoriasPage.dart';
import 'package:flutter/material.dart';


class DadosdoImovel extends StatefulWidget {
  @override
  _DadosdoImovelState createState() => _DadosdoImovelState();
}

class _DadosdoImovelState extends State<DadosdoImovel> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), backgroundColor: Colors.orange[900],),
      drawer: Drawer(
        child: ListView(children: <Widget> [
          DrawerHeader(
            child: Text("Menu"),
            decoration: BoxDecoration(color: Colors.grey[350]),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Item000"),
            onTap: () {},
          )
        ],
        ),
      ),
      body: Container(
        color: Colors.grey[900],
        child: ListView(
            children: <Widget>[
              Container(
                width: 200,
                height: 130,
              ),
              Container(
                  height: 75,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(50))),
                      labelText: 'CPD',
                    ),
                  ),
                ),
              Container(
                  height: 75,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(50))),
                      labelText: 'Descrição do imovel',
                    ),
                  ),
                ),   
          ],
      ),
     ),
   );
  }
}