class User {
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String city;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNumber,
    this.city
  });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['Nome'];
    lastName = json['Sobrenome'];
    email = json['Email'];
    password = json['Senha'];
    phoneNumber = json['Telefone'];
    city = json['Cidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nome'] = this.firstName;
    data['Sobrenome'] = this.lastName;
    data['Email'] = this.email;
    data['Senha'] = this.password;
    data['Telefone'] = this.phoneNumber;
    data['Cidade'] = this.city;
    return data;
  }

  String toString(){
    return "User(nome: $firstName, email: $email)";
  }
}