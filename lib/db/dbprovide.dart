import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:ez_vistors/Models/Vistoria_test.dart';

class dbHelp {
  static final _databaseName = 'dbvistorias.db';
  static final _databaseVersion = 1;

  dbHelp._privateConstructor();
  static final dbHelp instance = dbHelp._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE VISTORIA (
      idvistoria INTEGER PRIMARY KEY AUTOINCREMENT,
      FOREIGN KEY(idimovel) REFERENCES Imovel(idimovel),
      FOREIGN KEY(idcomodo) REFERENCES Comodos(idcomodos)
    );
    
    ''');
    await db.execute('''
      CREATE TABLE Imovel (
        idimovel INTEGER PRIMARY KEY AUTOINCREMENT,
        cpd TEXT NOT NULL,
        descricao TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE Comodos(
        nome TEXT NOT NULL,
        FOREIGN KEY(iditens) REFERENCES Itens(iditens)
      )
    ''');
    await db.execute('''
      CREATE TABLE Itens(
        iditens INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        material TEXT NOT NULL,
        condicao TEXT NOT NULL,
        obeservacao TEXT NOT NULL,
        FOREIGN KEY (idfotos) REFERENCES Fotos(idfotos)
      )
    ''');
    await db.execute('''
      CREATE TABLE Fotos(
        idfotos INTEGER PRIMARY KEY AUTOINCREMENT,
        file TEXT NOT NULL
      )
    ''');
  }

  createVistoria(VistoriaTest vistoria) async {
    final db = await dbHelp._database;
    db.insert('Vistoria', vistoria.toMap());
  }

  Future<List<VistoriaTest>> getAllCategories() async {
    final db = await dbHelp._database;
    List<Map<String, dynamic>> allRows = await db.query('vistoriaTest');
    List<VistoriaTest> vistoriatest = allRows
        .map((vistoriaTest) => VistoriaTest.fromMap(vistoriaTest))
        .toList();

    return vistoriatest;
  }
}
