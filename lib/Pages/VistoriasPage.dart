import 'package:ez_vistors/Pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VistoriasPage extends StatefulWidget {
  @override
  _VistoriasPageState createState() => _VistoriasPageState();
}

class _VistoriasPageState extends State<VistoriasPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child:
    Scaffold(
        appBar: AppBar(
          title: Text('Vistorias'),
          backgroundColor: Colors.orange[900],
          bottom: TabBar(
            tabs: [
              Tab(text: "Entrada"),
              Tab(text: "Saida"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.grey[900],
              child: new Column(
                children: <Widget>[
                  FormField(builder: ,),
                  ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Container(
                        height: 50,
                        color: Colors.amber[600],
                        child: const Center(child: Text('Entry A')),
                      ),
                      Container(
                        height: 50,
                        color: Colors.amber[500],
                        child: const Center(child: Text('Entry B')),
                      ),
                      Container(
                        height: 50,
                        color: Colors.amber[100],
                        child: const Center(child: Text('Entry C')),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.grey[900],
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text('Map'),
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_album),
                    title: Text('Album'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone'),
                  ),
                ],
              ),
            )
          ],
        )
    )
    );
  }
}
