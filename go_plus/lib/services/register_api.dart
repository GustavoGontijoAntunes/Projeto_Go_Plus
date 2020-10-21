import 'dart:convert';

import 'file:///C:/Projetos_Flutter/go_plus/lib/entities/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  static Future<bool> save(Usuario u) async {
    Map<String, String> headers = {
      "Content-Type": "application/json"
    };
    var url = "https://go-plus.herokuapp.com/registro";

    Map params = {
      "Nome": u.firstName,
      "Sobrenome": u.lastName,
      "Email": u.email,
      "Senha": u.password,
      "Cidade": u.city,
      "Telefone": u.phoneNumber
    };

    var _body = json.encode(params);
    var response = await http.post(url, headers: headers, body: _body);

    print("Response body: ${response.body}");

    Map mapResponse = json.decode(response.body);

    if(mapResponse.keys.contains("token")){
      return true;
    }else{
      return false;
    }
  }
}