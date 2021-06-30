import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ez_vistors/Models/Vistorias.dart';
import 'dart:io';
import 'package:get/get.dart';

class PreviewImagePage extends StatefulWidget {
  final Itens item;
  final int indice;

  PreviewImagePage({Key key, this.indice, this.item}) : super(key: key);

  @override
  _PreviewImagePageState createState() => _PreviewImagePageState();
}

class _PreviewImagePageState extends State<PreviewImagePage> {
  Itens _item;
  File file;

  @override
  void initState() {
    super.initState();
    _item = widget.item;
    file = _item.fotos[widget.indice].file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.file(file, fit: BoxFit.cover),
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
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () {
                              file.delete();

                              setState(() {
                                _item.fotos.removeAt(widget.indice);

                                if (_item.fotos.length == 0) {
                                  _item.fotos = [];
                                }
                              });

                              Navigator.pop(context);
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
}
