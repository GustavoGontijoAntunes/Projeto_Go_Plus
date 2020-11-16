import 'dart:convert';
import 'file:///C:/Projetos_Flutter/go_plus/lib/entities/user.dart';
import 'package:go_plus/components/prefs.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {
  static Future<User> login(String email, String password) async {

    User user = User();
    var url = 'https://go-plus.herokuapp.com/autenticacao';
    var header = {"Content-Type": "application/json"};

    Map params = {
      "email": email,
      "password": password
    };

    var _body = json.encode(params);
    var response = await http.post(url, headers: header, body: _body);

    Map mapResponse = json.decode(response.body);

    if(!mapResponse.containsKey("error")){
      user = User.fromJson(mapResponse['usuario']);
      user.setToken(mapResponse['token']);

      print(mapResponse['token']);

      user.save();

    }else{
      user = null;
    }

    return user;
  }
}