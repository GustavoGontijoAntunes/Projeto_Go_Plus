import 'dart:convert';
import 'file:///C:/Projetos_Flutter/go_plus/lib/entities/user.dart';
import 'package:http/http.dart' as http;

class ProfileApi {
  static Future<User> profile(String token, int id) async {

    var user;
    var url = 'https://go-plus.herokuapp.com/dadosusuario';
    var header = {
      "Content-Type": "application/json",
      "x-access-token": token,
    };

    Map params = {
      "id": id
    };

    var _body = json.encode(params);
    var response = await http.post(url, headers: header, body: _body);

    Map mapResponse = json.decode(response.body);
    print(mapResponse);
    print(mapResponse['usuario']);

    //if(mapResponse != null){
      user = User.fromJson(mapResponse['usuario'][0]);
    //}else{
    //  user = null;
    //}

    return user;
  }
}