import 'dart:convert';
import 'file:///C:/Projetos_Flutter/go_plus/lib/entities/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<Usuario> login(String email, String password) async {

    var usuario;
    var url = 'https://go-plus.herokuapp.com/autenticacao';
    var header = {"Content-Type": "application/json"};

    Map params = {
      "email": email,
      "password": password
    };

    var _body = json.encode(params);
    var response = await http.post(url, headers: header, body: _body);

    Map mapResponse = json.decode(response.body);

    if(mapResponse.keys.contains("token")){
      usuario = Usuario.fromJson(mapResponse);
    }else{
      usuario = null;
    }

    return usuario;
  }
}