class Usuario {
  String token;

  Usuario({this.token});

  Usuario.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }

  String toString(){
    return "Usuario(token: $token)";
  }
}