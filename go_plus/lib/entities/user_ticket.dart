class UserTicket {
  int id;
  String eventName;
  String ticketName;
  DateTime date;
  String local;
  String imageSrc;
  String city;
  String uf;
  String country;
  String qrCode;

  UserTicket({
    this.id,
    this.eventName,
    this.ticketName,
    this.date,
    this.local,
    this.imageSrc,
    this.city,
    this.uf,
    this.country,
    this.qrCode,
  });

  UserTicket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventName = json['eventName'];
    ticketName = json['ticketName'];
    date = json['date'];
    local = json['local'];
    imageSrc = json['imageSrc'];
    city = json['city'];
    uf = json['uf'];
    country = json['country'];
    qrCode = json ['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomeEvento'] = this.eventName;
    data['nomeTicket'] = this.ticketName;
    data['data'] = this.date;
    data['local'] = this.local;
    data['imagem'] = this.imageSrc;
    data['cidade'] = this.city;
    data['uf'] = this.uf;
    data['pais'] = this.country;
    data['qrCode'] = this.qrCode;
    return data;
  }

  String toString() {
    return "Event(Nome: $ticketName, Data: $date, Local: $local)";
  }
}

List<UserTicket> userTicket = [
  UserTicket(
    id: 1,
    eventName: "Funeral da Porca",
    ticketName: "Van do Carlos",
    date: DateTime(2021, 01, 31, 15, 00),
    local: "Praça Principal",
    imageSrc: "assets/images/Funeral_da_Porca.png",
    city: "Divinópolis",
    uf: "MG",
    country: "Brasil",
    qrCode: "VanDoCarlos1217",
  ),
];