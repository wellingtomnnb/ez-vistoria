import 'package:ez_vistors/Theme/Cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ez_vistors/Models/Vistorias.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DetalheItemPage extends StatefulWidget {
  final Itens item;
  final Vistoria vistoria;

  DetalheItemPage({Key key, this.item, this.vistoria}) : super(key: key);

  @override
  _DetalheItemPageState createState() => _DetalheItemPageState();
}

class _DetalheItemPageState extends State<DetalheItemPage> {
  Itens _item;
  Vistoria _vistoria;

  TextEditingController _materialController = TextEditingController();
  TextEditingController _condicaoController = TextEditingController();
  TextEditingController _observacaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _item = widget.item;
    _vistoria = widget.vistoria;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${_item.nome}'),
          backgroundColor: Cores.laranja,
          bottom: TabBar(
            tabs: [
              Tab(text: "Detalhes"),
              Tab(text: "Fotos"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO - ADICIONAR ACAO PARA ABRIR A CAMERA E TIRAR FOTO
          },
          backgroundColor: Cores.laranja,
          child: Icon(Icons.add_a_photo),
        ),
        body: TabBarView(
          children: [
            _formContainer(),
            _listFotosContainer(),
          ],
        ),
      ),
    );
  }

  _saveData() {
    //TODO - Colocar rotina de salvar aqui
  }

  _formContainer() {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
      color: Cores.cinza_fundo,
      child: Column(
        children: <Widget>[
          TextField(
            controller: _materialController,
            style: TextStyle(color: Cores.texto_branco),
            decoration: InputDecoration(
                hintText: "Em madeira,Ferro, Plastico, etc...",
                labelText: "Material do item"),
          ),
          TextField(
            controller: _condicaoController,
            style: TextStyle(color: Cores.texto_branco),
            decoration: InputDecoration(
                hintText: "Em bom estado, com lascados, danificado, etc...",
                labelText: "Condição do item"),
          ),
          TextField(
            controller: _observacaoController,
            style: TextStyle(color: Cores.texto_branco),
            decoration: InputDecoration(labelText: "Observações"),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            //Normal textInputField will be displayed
            maxLines: 5, // when user presses enter it will adapt to it
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
          ),
          ElevatedButton(
            child: Text(
              'Salavar',
              style: TextStyle(fontSize: 18),
            ),
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.only(left: 60, right: 60)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Cores.texto_branco),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Cores.laranja),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        side: BorderSide(color: Colors.red)))),
            onPressed: () {
              _saveData();
            },
          )
        ],
      ),
    );
  }

  _listFotosContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Cores.cinza_fundo,
      child: new StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) => new Container(
            color: Colors.green,
            child: new Center(
              child: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('$index'),
              ),
            )),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
