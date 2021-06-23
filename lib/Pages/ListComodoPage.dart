import 'package:ez_vistors/Models/Vistorias.dart';
import 'package:ez_vistors/Pages/ItemPage.dart';
import 'package:ez_vistors/Theme/Cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class ListComodoPage extends StatefulWidget {
  final Vistoria vistoria;

  ListComodoPage({Key key, this.vistoria}) : super(key: key);

  @override
  _ListComodoPageState createState() => _ListComodoPageState();
}

class _ListComodoPageState extends State<ListComodoPage> {
  Vistoria _vistoria;
  List<Comodos> _comodos;

  TextEditingController _searchController = TextEditingController();
  TextEditingController _novoComodoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _vistoria = widget.vistoria;
    _comodos = widget.vistoria.comodos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vistoria CPD: ' + _vistoria.imovel.cpd),
          backgroundColor: Cores.laranja,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO - ADICIONAR ACAO PARA ABRIR A CAMERA E TIRAR FOTO
            Alert(
                context: context,
                title: "Novo Comodo",
                content: Column(
                  children: <Widget>[
                    TextField(
                      controller: _novoComodoController,
                      decoration: InputDecoration(
                        labelText: 'Nome do Comodo',
                        hintText: 'Sala, Varanda, etc...',
                      ),
                    )
                  ],
                ),
                buttons: [
                  DialogButton(
                    color: Cores.laranja,
                    onPressed: () => _addComodo(),
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
                  return _listaComodos(index - 2, _comodos);
                }
              },
              itemCount: _comodos.length + 2),
        ));
  }


    _addComodo(){
      Comodos comodo = new Comodos(nome: _novoComodoController.text);
      setState(() {
        _vistoria.comodos.add(comodo);
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
            labelText: "Comodos",
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

  _listaComodos(index, List<Comodos> modelo) {
    return Card(
        color: Cores.laranja,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemPage(comodo: modelo[index], vistoria: _vistoria),
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
