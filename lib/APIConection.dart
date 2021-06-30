import 'package:dio/dio.dart';

class APIConection{
  Dio dio = new Dio();

  Future<void> postVistorias(String data) async{
    var response = await dio.post('https://ezvistoria.webmaveric.net/api/add/vistoria', data: data);
    return response;
  }

}