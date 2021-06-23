import 'package:ez_vistors/Pages/DetalheItemPage.dart';
import 'package:ez_vistors/Theme/Cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ez_vistors/Models/Vistorias.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ItemPage extends StatefulWidget {
  final Comodos comodo;
  final Vistoria vistoria;

  ItemPage({Key key, this.comodo, this.vistoria}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Comodos _comodo;
  Vistoria _vistoria;

  TextEditingController _searchController = TextEditingController();
  TextEditingController _novoItemController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _comodo = widget.comodo;
    _vistoria = widget.vistoria;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${_comodo.nome}'),
          backgroundColor: Cores.laranja,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO - ADICIONAR ACAO PARA ABRIR A CAMERA E TIRAR FOTO
            Alert(
                context: context,
                title: "Novo item",
                content: Column(
                  children: <Widget>[
                    TextField(
                      controller: _novoItemController,
                      decoration: InputDecoration(
                        labelText: 'Nome do Comodo',
                        hintText: 'Troneira, Tomada, etc...',
                      ),
                    )
                  ],
                ),
                buttons: [
                  DialogButton(
                    color: Cores.laranja,
                    onPressed: () => _addItem(),
                    child: Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ]).show();
          },
          backgroundColor: Cores.laranja,
          child: Icon(Icons.add_circle),
        ),
        backgroundColor: Cores.cinza_fundo,
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _cardVistoria();
                } else if (index == 1) {
                  return _searchBar();
                } else {
                  return _listaItens(index - 2, _comodo.itens);
                }
              },
              itemCount: _comodo.itens.length + 2),
        ));
  }

  _addItem() {
    Itens item = new Itens(nome: _novoItemController.text, fotos: []);
    setState(() {
      _comodo.itens.add(item);
      Navigator.pop(context);
    });
  }

  _cardVistoria() {
    return Card(
      color: Cores.laranja,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 32, right: 16, bottom: 32, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "CPD: ${_vistoria.imovel.cpd}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Cores.texto_branco),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Imóvel: ${_vistoria.imovel.descricao}",
                style: TextStyle(fontSize: 18, color: Cores.texto_branco),
              ),
            )
          ],
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        style: TextStyle(color: Cores.texto_branco),
        decoration: InputDecoration(
            hintText: "Pesquisar",
            labelText: "Itens",
            icon: Icon(
              Icons.search,
              color: Cores.texto_branco,
            ),
            suffixIcon: IconButton(
              onPressed: _searchController.clear,
              icon: Icon(Icons.cancel),
              color: Cores.cinza_claro,
            )),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            //TODO - FILTRO DE COMODOS
          });
        },
      ),
    );
  }

  _listaItens(index, List<Itens> modelo) {
    return Card(
        color: Cores.laranja,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetalheItemPage(item: modelo[index], vistoria: _vistoria),
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
                  modelo[index].nome,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Cores.texto_branco),
                ),
              ],
            ),
          ),
        ));
  }
}
