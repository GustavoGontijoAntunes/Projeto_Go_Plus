import 'dart:convert';
import 'file:///C:/Projetos_Flutter/go_plus/lib/entities/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {
  static Future<User> login(String email, String password) async {

    var user;
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

      user = User.fromJson(mapResponse);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', mapResponse['token']);
      await prefs.setInt('id', mapResponse['Id']);

    }else{
      user = null;
    }

    return user;
  }
}