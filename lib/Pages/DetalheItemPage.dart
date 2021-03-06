import 'package:camera_camera/camera_camera.dart';
import 'package:ez_vistors/Pages/PreviewImagePage.dart';
import 'package:ez_vistors/Theme/Cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ez_vistors/Models/Vistorias.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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
  File file;

  TextEditingController _materialController = TextEditingController();
  TextEditingController _condicaoController = TextEditingController();
  TextEditingController _observacaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _item = widget.item;
    _vistoria = widget.vistoria;

    if(_item.fotos.length >= 1){
      var zero = _item.fotos[0].file;
      if (zero == null) {
        _item.fotos.removeAt(0);
      }
    }

    _condicaoController.text = _item.condicao;
    _materialController.text = _item.material;
    _observacaoController.text = _item.observacao;
  }

  previewImage(file) async {
    if (file != null) {
      var isExist = await file.exists();
      if(isExist){
        setState(() {
          _item.fotos.add(Fotos(file: file.path));
        });
        _showToast(this.context, "Arquivo numero ${_item.fotos.length}, salvo com sucesso!");
      }
    }
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      CameraCamera(onFile: (file) => previewImage(file)),
                ));
          },
          backgroundColor: Cores.laranja,
          child: Icon(Icons.add_a_photo),
        ),
        body: TabBarView(
          children: [
            _formContainer(),
            _listFotosContainer(_item.fotos),
          ],
        ),
      ),
    );
  }

  bool _validate(){
    bool hasError = false;

    if(_condicaoController.text == null){
      _showToast(this.context, "Prencha o campo condi????o");
      hasError = true;
    }

    if(_materialController.text == null){
      _showToast(this.context, "Prencha o campo material");
      hasError = true;
    }

    return hasError;
  }
  _saveData() {
    if(!_validate()){
      setState(() {
        _item.condicao = _condicaoController.text;
        _item.material = _materialController.text;
        _item.observacao = _observacaoController.text;

        _showToast(this.context, "Item salvo com sucesso!");
      });
    }
  }

  _formContainer() {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
      color: Cores.cinza_fundo,
        child: ListView(
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
                  labelText: "Condi????o do item"),
            ),
            TextField(
              controller: _observacaoController,
              style: TextStyle(color: Cores.texto_branco),
              decoration: InputDecoration(labelText: "Observa????es"),
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
                'Salvar',
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
        )
    );
  }

  _listFotosContainer(List<Fotos> modelo) {

    return Container(
      padding: const EdgeInsets.all(10),
      color: Cores.cinza_fundo,
      child: new StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: _item.fotos.length,
        itemBuilder: (BuildContext context, int index) => new Container(
          color: Cores.laranja,
          child: InkWell(
            child: Image.file(File(modelo[index].file), fit: BoxFit.cover),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PreviewImagePage(item: _item, indice: index),
                ),
              ).then((value) => setState(() {}));
            },
          ),
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  void _showToast(BuildContext context, String texto) {
    Fluttertoast.showToast(
        msg: texto,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Cores.laranja,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
