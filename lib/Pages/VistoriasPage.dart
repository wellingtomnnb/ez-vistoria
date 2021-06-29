import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ez_vistors/Models/Vistorias.dart';
import 'package:ez_vistors/Pages/HomePage.dart';
import 'package:ez_vistors/Pages/ListComodoPage.dart';
import 'package:ez_vistors/Theme/Bordas.dart';
import 'package:ez_vistors/Theme/Cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as developer;

import 'LoginPage.dart';
import 'SobrePage.dart';

class VistoriasPage extends StatefulWidget {
  @override
  _VistoriasPageState createState() => _VistoriasPageState();
}

class _VistoriasPageState extends State<VistoriasPage> {
  Vistorias _vistoriasLocal;
  Vistorias _vistoriasServidor;
  TextEditingController _searchLocalController = TextEditingController();
  TextEditingController _searchServerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //TODO - COLOCAR ROTINA PARA BUCAR E IMPORTAR DADOS DO SERVIDOR AQUI
    //_vistoriasLocal = Vistorias.fromJson(jsonDecode(
//        "{\"vistoria\":[{\"imovel\":{\"cpd\":\"1333\",\"descricao\":\"Imovel numero 1\"},\"comodos\":[{\"nome\":\"Hall da escada\",\"itens\":[{\"nome\":\"Maquin\u00e1rio\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"3285\",\"descricao\":\"Imovel numero 2\"},\"comodos\":[{\"nome\":\"Lavabo\",\"itens\":[{\"nome\":\"Tanque\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"2873\",\"descricao\":\"Imovel numero 3\"},\"comodos\":[{\"nome\":\"Copa\",\"itens\":[{\"nome\":\"Ilumina\u00e7\u00e3o\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"3317\",\"descricao\":\"Imovel numero 4\"},\"comodos\":[{\"nome\":\"Closet\",\"itens\":[{\"nome\":\"Prateleira\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"2763\",\"descricao\":\"Imovel numero 5\"},\"comodos\":[{\"nome\":\"Quarto\",\"itens\":[{\"nome\":\"Tamp\u00e3o de \u00c1gua\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"1573\",\"descricao\":\"Imovel numero 6\"},\"comodos\":[{\"nome\":\"teste II\",\"itens\":[{\"nome\":\"Roupas de Cama\/ Mesa\/ Banho\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"2419\",\"descricao\":\"Imovel numero 7\"},\"comodos\":[{\"nome\":\"Chaves\",\"itens\":[{\"nome\":\"Outros\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]}]}"));


    _vistoriasLocal = new Vistorias(vistoria: []);

    _vistoriasServidor = _vistoriasLocal;


    _getVistoriasServidor();
  }

  Future<void> _getVistoriasServidor() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get("https://ezvistoria.webmaveric.net/api/vistorias");


    setState(() {
      _vistoriasServidor = Vistorias.fromJson(jsonDecode(response.data.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Vistorias'),
              backgroundColor: Cores.laranja,
              bottom: TabBar(
                tabs: [
                  Tab(text: "Local"),
                  Tab(text: "Servidor"),
                ],
              ),
            ),
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
            body: TabBarView(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Cores.cinza_fundo,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return index == 0
                            ? _searchBar(
                                _searchLocalController, _vistoriasLocal, 1)
                            : _listaVistorias(index - 1, _vistoriasLocal);
                      },
                      itemCount: _vistoriasLocal.vistoria.length + 1),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Cores.cinza_fundo,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return index == 0
                            ? _searchBar(
                                _searchServerController, _vistoriasServidor, 2)
                            : _listaVistorias(index - 1, _vistoriasServidor);
                      },
                      itemCount: _vistoriasServidor.vistoria.length + 1),
                )
              ],
            )));
  }

  _searchBar(TextEditingController controller, Vistorias modelo, tem) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Cores.texto_branco),
        decoration: InputDecoration(
            hintText: "Pesquisar",
            labelText: "Pesquisar",
            icon: Icon(
              Icons.search,
              color: Cores.texto_branco,
            ),
            suffixIcon: IconButton(
              onPressed: controller.clear,
              icon: Icon(Icons.cancel),
              color: Cores.cinza_claro,
            )),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            var buscaCpd = modelo.vistoria
                .where((element) => element.imovel.cpd.contains(text));

            if (buscaCpd.length == 0) {
              var buscaDescricao = modelo.vistoria
                  .where((element) => element.imovel.descricao.contains(text));
              if (buscaDescricao.length > 0) {
                modelo.vistoria = buscaDescricao;
              } else {
                _showToast(context, "Nenhum registro encontrado.");
              }
            } else {
              modelo.vistoria = buscaCpd;
            }

          });
        },
      ),
    );
  }

  _listaVistorias(index, Vistorias modelo) {
    return Card(
        color: Cores.laranja,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ListComodoPage(vistoria: modelo.vistoria[index]),
              ),
            );
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 32, right: 16, bottom: 32, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  modelo.vistoria[index].imovel.cpd,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Cores.texto_branco),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    modelo.vistoria[index].imovel.descricao,
                    style: TextStyle(fontSize: 18, color: Cores.texto_branco),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _showToast(BuildContext context, String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Cores.cinza_fundo,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
