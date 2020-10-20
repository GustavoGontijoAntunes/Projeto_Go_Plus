class Usuario {
  String token;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String city;

  Usuario({
    this.token,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNumber,
    this.city
  });

  Usuario.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    firstName = json['nome'];
    lastName = json['sobrenome'];
    email = json['email'];
    password = json['senha'];
    phoneNumber = json['telefone'];
    city = json['cidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['nome'] = this.firstName;
    data['sobrenome'] = this.lastName;
    data['email'] = this.email;
    data['senha'] = this.password;
    data['telefone'] = this.phoneNumber;
    data['cidade'] = this.city;
    return data;
  }

  String toString(){
    return "Usuario(token: $token, nome: $firstName, email: $email)";
  }
}