class Driver {
  int id;
  int numberTrips;
  int numberMonthTrips;
  int numberKmTrips;
  String driverName;
  int driverAge;
  String typeCNH;
  String phoneNumber;
  String city;
  String uf;
  String country;
  String vanModel;
  String vanColor;
  int vanOccupation;
  String licensePlateVan;
  double grade;
  String ticketName;
  String img1;
  String img2;
  String img3;
  String img4;

  Driver({
    this.id,
    this.numberTrips,
    this.numberMonthTrips,
    this.numberKmTrips,
    this.driverName,
    this.driverAge,
    this.typeCNH,
    this.phoneNumber,
    this.city,
    this.uf,
    this.country,
    this.vanModel,
    this.vanColor,
    this.vanOccupation,
    this.licensePlateVan,
    this.grade,
    this.ticketName,
    this.img1,
    this.img2,
    this.img3,
    this.img4,
  });

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numberTrips = json['numberTrips'];
    numberMonthTrips = json['numberMonthTrips'];
    numberKmTrips = json['numberKmTrips'];
    driverName = json['driverName'];
    driverAge = json['driverAge'];
    typeCNH = json['typeCNH'];
    phoneNumber = json['phoneNumber'];
    city = json['city'];
    uf = json['uf'];
    country = json['country'];
    vanModel = json['vanModel'];
    vanColor = json['vanColor'];
    vanOccupation = json['vanOccupation'];
    licensePlateVan = json['licensePlateVan'];
    grade = json['grade'];
    ticketName = json['ticketName'];
    img1 = json['img1'];
    img2 = json['img2'];
    img3 = json['img3'];
    img4 = json['img4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['numeroViagens'] = this.numberTrips;
    data['numeroMesesViagens'] = this.numberMonthTrips;
    data['numeroKmViagens'] = this.numberKmTrips;
    data['nomeMotorista'] = this.driverName;
    data['idadeMotorista'] = this.driverAge;
    data['cnhMotorista'] = this.typeCNH;
    data['telefoneMotorista'] = this.phoneNumber;
    data['cidadeMotorista'] = this.city;
    data['uf'] = this.uf;
    data['pais'] = this.country;
    data['modeloVan'] = this.vanModel;
    data['corVan'] = this.vanColor;
    data['ocupacaoVan'] = this.vanOccupation;
    data['placaVan'] = this.licensePlateVan;
    data['nota'] = this.grade;
    data['nomeTicket'] = this.ticketName;
    data['img1'] = this.img1;
    data['img2'] = this.img2;
    data['img3'] = this.img3;
    data['img4'] = this.img4;
    return data;
  }

  String toString() {
    return "Event(Id: $id, Nome Motorista: $driverName, Cidade Motorista: $city)";
  }
}

List<Driver> drivers = [
  Driver(
    id: 1,
    numberTrips: 6,
    numberMonthTrips: 5,
    numberKmTrips: 347,
    driverName: "Júlio José dos Santos Corradi",
    driverAge: 38,
    typeCNH: "C",
    phoneNumber: "(37) 99955-3248",
    city: "Mateus Leme",
    uf: "MG",
    country: "Brasil",
    vanModel: "Mercedes-benz Sprinter",
    vanColor: "Prata",
    vanOccupation: 16,
    licensePlateVan: "GWR7845",
    grade: 3.2,
    ticketName: "Van do Júlio",
    img1: "assets/images/Sprinter1.jpg",
    img2: "assets/images/Sprinter2.jpg",
    img3: "assets/images/Sprinter3.jpg",
    img4: "assets/images/Sprinter4.jpg",
  ),
  Driver(
    id: 2,
    numberTrips: 19,
    numberMonthTrips: 14,
    numberKmTrips: 1341,
    driverName: "Carlos Júnior do Amaral",
    driverAge: 42,
    typeCNH: "D",
    phoneNumber: "(37) 98786-9023",
    city: "Divinópolis",
    uf: "MG",
    country: "Brasil",
    vanModel: "Fiat Ducato Combinato",
    vanColor: "Prata",
    vanOccupation: 17,
    licensePlateVan: "GQU1830",
    grade: 3.8,
    ticketName: "Van do Carlos",
    img1: "assets/images/Ducato1.jpg",
    img2: "assets/images/Ducato2.jpg",
    img3: "assets/images/Ducato3.jpg",
    img4: "assets/images/Ducato4.jpg",
  ),
  Driver(
    id: 3,
    numberTrips: 42,
    numberMonthTrips: 24,
    numberKmTrips: 3403,
    driverName: "José Paulo Silva Nunes",
    driverAge: 51,
    typeCNH: "D",
    phoneNumber: "(37) 98786-9023",
    city: "Belo Horizonte",
    uf: "MG",
    country: "Brasil",
    vanModel: "Renault Master Executiva",
    vanColor: "Prata",
    vanOccupation: 20,
    licensePlateVan: "HKB8265",
    grade: 4.7,
    ticketName: "Van do José",
    img1: "assets/images/Renault1.jpg",
    img2: "assets/images/Renault2.jpg",
    img3: "assets/images/Renault3.jpg",
    img4: "assets/images/Renault4.jpg",
  ),
];