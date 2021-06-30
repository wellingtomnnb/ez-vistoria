import 'dart:convert';

import 'package:ez_vistors/Models/Vistorias.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class rowVistoria {
  String json;
  int idvistoria;

  rowVistoria({this.json, this.idvistoria});

  Map<String, dynamic> toMap() {
    return {'idvistoria': this.idvistoria, 'json': this.json};
  }
}

class Db2 {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'vistorias.db'),
        onCreate: (db, version) {
      _createDb(db);
    }, version: 3);
  }

  static void _createDb(sql.Database db) {
    db.execute('''CREATE TABLE Vistorias (
      idvistoria INTEGER PRIMARY KEY AUTOINCREMENT,
      json, TEXT
      );''');
  }

  static addVistoria(Vistoria vistoria) async {
    final db = await database();
    rowVistoria v = new rowVistoria(json: jsonEncode(vistoria.toJson()).toString());
    //v.json = jsonEncode(v.json).toString();
    print(v.json);

    var row = await db.insert('Vistorias', v.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.ignore);
    print(row);
  }

  static Future<List<Vistoria>> getAllVistorias() async {
    final db = await database();

    List<Map<String, dynamic>> allRows = await db.query('Vistorias');

    List<Vistoria> vt = [];

    JsonCodec codec = new JsonCodec();
    for (var row in allRows) {
      var json = (row['json']);
      vt.add(Vistoria.fromJson(jsonDecode(json.toString())));
    }
    return vt;
  }

  static Future<void> saveAllVistorias(Vistorias vistorias) async {
    final db = await database();
    var del = db.execute('delete from vistorias');

    for (var item in vistorias.vistoria) {
      rowVistoria v = new rowVistoria(json: jsonEncode(item.toJson()).toString());

      print(json);

      var addrow = await db.insert('Vistorias', v.toMap());

      print(addrow);
    }
  }
}
