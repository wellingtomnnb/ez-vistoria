import 'package:ez_vistors/Theme/Cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ez_vistors/Models/Vistorias.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfPreviewPage extends StatefulWidget {
  final Vistoria vistoria;

  PdfPreviewPage({Key key, this.vistoria}) : super(key: key);

  @override
  _PdfPreviewPageState createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  Vistoria _vistoria;
  var pdf;
  bool _gerado = false;


  @override
  void initState() {
    super.initState();
    _vistoria = widget.vistoria;
    pdf = pw.Document();
  }

  _preview_content() {
    return Column(
      children: <Widget>[
        _vistoriaHeader(),
        Column(
          children: [for (var c in _vistoria.comodos) _showComodos(c)],
        )
      ],
    );
  }

  _vistoriaHeader() {
    return Column(
      children: [
        Center(
          child: Text(
            "Vistoria CPD: ${_vistoria.imovel.cpd}",
            style: TextStyle(fontSize: 32),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Row(
            children: [
              Text(
                "Imovel:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  "CPD: ${_vistoria.imovel.cpd} - ${_vistoria.imovel.descricao}"),
            ],
          ),
        )
      ],
    );
  }

  _showComodos(Comodos comodo) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30,top: 20),
          child: Text(
            comodo.nome,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ),
        for (var item in comodo.itens) _showItens(item)
      ],
    );
  }

  _showItens(Itens item) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30,top: 15),
          child: Column(
            children: [
              Text(
                "Item: ${item.nome} em ${item.condicao}, feito de ${item.material}.",
              ),
              Text("Observações: ${item.observacao}")
            ],
          ),
        )
      ],
    );
  }

  _pdf_content() {
    return pw.Column(
      children: <pw.Widget>[
        pw.Center(
          child: pw.Text(
            "Vistoria",
            style: pw.TextStyle(fontSize: 32),
          ),
        )
      ],
    );
  }

  _pdf_Save() async {
    _showToast(context, "Gerando pdf...");
    final output = await getTemporaryDirectory();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Center(child: _pdf_content());
        }));

    File file =
        await File("${output.path}/vistoria_cpd_${_vistoria.imovel.cpd}.pdf");

    if (file != null) {
      print(file.path);
      _showToast(context, "Arquivo salvo com sucesso!");

    } else {
      _showToast(context, "Ops! Não foi possível salvar o arquivo.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: ListView(
                    children: <Widget>[
                      _preview_content()
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.black.withOpacity(0.5),
                          child: IconButton(
                            icon: Icon(
                              Icons.file_download,
                              color: Cores.laranja,
                              size: 30,
                            ),
                            onPressed: () {
                              _pdf_Save();
                              //Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.black.withOpacity(0.5),
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
