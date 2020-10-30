import 'dart:convert' as convert;
import 'package:go_plus/components/prefs.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String city;
  String token;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNumber,
    this.city,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    firstName = json['Nome'];
    lastName = json['Sobrenome'];
    email = json['Email'];
    password = json['Senha'];
    phoneNumber = json['Telefone'];
    city = json['Cidade'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Nome'] = this.firstName;
    data['Sobrenome'] = this.lastName;
    data['Email'] = this.email;
    data['Senha'] = this.password;
    data['Telefone'] = this.phoneNumber;
    data['Cidade'] = this.city;
    data['token'] = this.token;
    return data;
  }

  String toString(){
    return "User(nome: $firstName, sobrenome: $lastName, email: $email, senha: $password, "
        "telefone: $phoneNumber, cidade: $city, token: $token)";
  }

  void save(){
    //print("Dentro do metodo save");
    Map map = toJson();
    //print("MAP ==> $map");
    String json = convert.json.encode(map);
    //print("JSON ==> $json");
    Prefs.setString("user.prefs", json);
  }

  static Future<User> getUser() async{
    String json = await Prefs.getString("user.prefs");
    Map map = convert.json.decode(json);
    User user = User.fromJson(map);

    return user;
  }

  void setToken(String t){
    this.token = t;
  }
}