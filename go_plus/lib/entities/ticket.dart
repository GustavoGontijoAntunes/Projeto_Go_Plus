class Ticket {
  int id;
  DateTime exitDate;
  String exitLocation;
  String exitCity;
  String exitUf;
  String exitCountry;
  String travelType;
  double price;
  int totalOccupation;
  int occupation;
  int idEvent;
  int idDriver;
  int idUser;
  double grade;
  String name;

  Ticket({
    this.id,
    this.exitDate,
    this.exitLocation,
    this.exitCity,
    this.exitUf,
    this.exitCountry,
    this.travelType,
    this.price,
    this.totalOccupation,
    this.occupation,
    this.idEvent,
    this.idDriver,
    this.idUser,
    this.grade,
    this.name,
  });

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exitDate = json['exitDate'];
    exitLocation = json['exitLocation'];
    exitCity = json['exitCity'];
    exitUf = json['exitUf'];
    exitCountry = json['countryLocation'];
    travelType = json['travelType'];
    price = json['price'];
    totalOccupation = json['totalOccupation'];
    occupation = json['occupation'];
    idEvent = json['idEvent'];
    idDriver = json['idDriver'];
    idUser = json['idUser'];
    grade = json['grade'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dataSaida'] = this.exitDate;
    data['localSaida'] = this.exitLocation;
    data['cidadeSaida'] = this.exitCity;
    data['ufSaida'] = this.exitUf;
    data['paisSaida'] = this.exitCountry;
    data['tipoViagem'] = this.travelType;
    data['preco'] = this.price;
    data['ocupacaoTotal'] = this.totalOccupation;
    data['ocupacao'] = this.occupation;
    data['idEvento'] = this.idEvent;
    data['idMotorista'] = this.idDriver;
    data['idUsuario'] = this.idUser;
    data['nota'] = this.grade;
    data['nome'] = this.name;
    return data;
  }

  String toString() {
    return "Event(Id: $id, Data de Saída: $exitDate, Local de Saída: $exitLocation)";
  }
}

List<Ticket> tickets = [
  Ticket(
    id: 1,
    exitDate: DateTime(2021, 01, 31, 15, 30),
    exitLocation: "Posto SP",
    exitCity: "Mateus Leme",
    exitUf: "MG",
    exitCountry: "Brasil",
    travelType: "Ida e Volta",
    price: 70.00,
    totalOccupation: 16,
    occupation: 2,
    idEvent: 5,
    idDriver: 1,
    grade: 3.2,
    name: "Van do Júlio   ",
  ),
  Ticket(
    id: 2,
    exitDate: DateTime(2021, 01, 31, 15, 00),
    exitLocation: "Praça Principal",
    exitCity: "Divinópolis",
    exitUf: "MG",
    exitCountry: "Brasil",
    travelType: "Ida e Volta",
    price: 80.00,
    totalOccupation: 17,
    occupation: 11,
    idEvent: 5,
    idDriver: 2,
    grade: 3.8,
    name: "Van do Carlos",
  ),
  Ticket(
    id: 3,
    exitDate: DateTime(2021, 01, 31, 14, 00),
    exitLocation: "Praça Sete",
    exitCity: "Belo Horizonte",
    exitUf: "MG",
    exitCountry: "Brasil",
    travelType: "Ida e Volta",
    price: 120.00,
    totalOccupation: 20,
    occupation: 20,
    idEvent: 5,
    idDriver: 3,
    grade: 4.7,
    name: "Van do José    ",
  ),
];