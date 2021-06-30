import 'package:ez_vistors/Models/Vistorias.dart';
import 'package:ez_vistors/db/Db2.dart';


class VistoriaUtil{

  static Future<void> addVistoria(Vistoria vistoria) async{
    await Db2.addVistoria(vistoria);
  }

  static Future<Vistorias> getVistorias() async{
    //Database base = await db.database;
    Vistorias vist = new Vistorias();
    vist.vistoria = await Db2.getAllVistorias();
    return vist;
  }

  static Future<void> saveAllVistorias(Vistorias vistorias) async{
    //Database base = await db.database;
    Vistorias vist = new Vistorias();
    await Db2.saveAllVistorias(vistorias);
  }
}