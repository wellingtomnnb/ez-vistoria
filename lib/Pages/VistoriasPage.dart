import 'dart:convert';

import 'package:ez_vistors/Models/Vistorias.dart';
import 'package:ez_vistors/Pages/HomePage.dart';
import 'package:ez_vistors/Pages/ListComodoPage.dart';
import 'package:ez_vistors/Theme/Cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    _vistoriasLocal = Vistorias.fromJson(jsonDecode(
        "{\"vistoria\":[{\"imovel\":{\"cpd\":\"2777\",\"descricao\":\"Imovel numero 1\"},\"comodos\":[{\"nome\":\"\u00c1rea externa\",\"itens\":[{\"nome\":\"Eletrodom\u00e9sticos\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"1366\",\"descricao\":\"Imovel numero 2\"},\"comodos\":[{\"nome\":\"Hall da escada\",\"itens\":[{\"nome\":\"Prateleira\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"2192\",\"descricao\":\"Imovel numero 3\"},\"comodos\":[{\"nome\":\"Hall da escada\",\"itens\":[{\"nome\":\"Porta Toalha\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"3392\",\"descricao\":\"Imovel numero 4\"},\"comodos\":[{\"nome\":\"Varanda\",\"itens\":[{\"nome\":\"Sa\u00edda de Antena\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"1004\",\"descricao\":\"Imovel numero 5\"},\"comodos\":[{\"nome\":\"\u00c1rea externa\",\"itens\":[{\"nome\":\"Mureta\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"1011\",\"descricao\":\"Imovel numero 6\"},\"comodos\":[{\"nome\":\"Sala\",\"itens\":[{\"nome\":\"Bomba Embutida\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"2093\",\"descricao\":\"Imovel numero 7\"},\"comodos\":[{\"nome\":\"Varanda\",\"itens\":[{\"nome\":\"Tampa de Vaso Sanit\u00e1rio\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"2942\",\"descricao\":\"Imovel numero 8\"},\"comodos\":[{\"nome\":\"teste II\",\"itens\":[{\"nome\":\"Mobilia\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"4861\",\"descricao\":\"Imovel numero 9\"},\"comodos\":[{\"nome\":\"\u00c1rea externa\",\"itens\":[{\"nome\":\"Registro\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]},{\"imovel\":{\"cpd\":\"1525\",\"descricao\":\"Imovel numero 10\"},\"comodos\":[{\"nome\":\"Lavabo\",\"itens\":[{\"nome\":\"Sif\u00e3o\",\"material\":\"\",\"condicao\":\"\",\"observacao\":\"\",\"fotos\":[{\"file\":\"\"}]}]}]}]}"));

    _vistoriasServidor = _vistoriasLocal;
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
