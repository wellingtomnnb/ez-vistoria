
import 'package:ez_vistors/Pages/CriarPage.dart';
import 'package:ez_vistors/Pages/HomePage.dart';
import 'package:ez_vistors/Pages/ListComodoPage.dart';
import 'package:ez_vistors/Pages/LoginPage.dart';
import 'package:ez_vistors/Pages/SobrePage.dart';
import 'package:ez_vistors/Pages/VistoriasPage.dart';
import 'package:ez_vistors/Models/Vistorias.dart';
import 'package:ez_vistors/Theme/Cores.dart';
import 'package:flutter/material.dart';


class DadosdoImovel extends StatefulWidget {
  @override
  _DadosdoImovelState createState() => _DadosdoImovelState();
}

class _DadosdoImovelState extends State<DadosdoImovel> {
  TextEditingController cpdController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dados do Imóvel'), backgroundColor: Colors.orange[900],),
      drawer: Drawer(
              child: ListView(children: <Widget> [
                DrawerHeader(
                  child: Text("Menu"),
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      image: DecorationImage(
                          image: NetworkImage('https://avalieja.com.br/wp-content/uploads/2020/10/WhatsApp-Image-2020-10-05-at-13.56.17.jpeg')
                      )
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()))
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
                    controller: cpdController, 
                    style: TextStyle(color: Cores.texto_branco),
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
                    controller: descricaoController,
                    style: TextStyle(color: Cores.texto_branco),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(50))),
                      labelText: 'Descrição do imovel',
                    ),
                  ),
                ),
              Container(
                    height: 75,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: ElevatedButton(
                      child: Text(
                        'Próximo',
                        style: TextStyle(fontSize: 22),
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.orange[900]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      side: BorderSide(color: Colors.red)))),
                      onPressed: () {
                        //TODO - COLOCAR ROTINA DE GRAVAR VISTORIA AQUI
                        Imovel dadosimovel = Imovel(cpd: cpdController.text, descricao: descricaoController.text);
                        Vistoria vistoria = Vistoria(imovel: dadosimovel, comodos: []);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => ListComodoPage(vistoria: vistoria)));
                      },
                    )
                ),   
          ],
      ),
     ),
   );
  }
}