class Event {
  int id;
  String name;
  String description;
  DateTime date;
  String local;
  String imageSrc;
  String city;
  String uf;
  String country;

  Event({
    this.id,
    this.name,
    this.description,
    this.date,
    this.local,
    this.imageSrc,
    this.city,
    this.uf,
    this.country,
  });

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    date = json['date'];
    local = json['local'];
    imageSrc = json['imageSrc'];
    city = json['city'];
    uf = json['uf'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.name;
    data['descricao'] = this.description;
    data['data'] = this.date;
    data['local'] = this.local;
    data['imagem'] = this.imageSrc;
    data['cidade'] = this.city;
    data['uf'] = this.uf;
    data['pais'] = this.country;
    return data;
  }

  String toString() {
    return "Event(Nome: $name, Data: $date, Local: $local)";
  }
}

List<Event> events = [
  Event(
    id: 1,
    name: "Funeral da Porca",
    description: "Descrição do evento Funeral da Porca.",
    date: DateTime(2021, 01, 31),
    local: "Parque de Exposições",
    imageSrc: "assets/images/Funeral_da_Porca.jpg",
    city: "Itaúna",
    uf: "MG",
    country: "Brasil",
  ),
  Event(
    id: 2,
    name: "Carnaval 2021",
    description: "Descrição do evento Carnaval.",
    date: DateTime(2021, 02, 15),
    local: "Praia de Copacabana",
    imageSrc: "assets/images/Carnaval.png",
    city: "Rio de Janeiro",
    uf: "RJ",
    country: "Brasil",
  ),
  Event(
    id: 3,
    name: "Festa Gusttavo Lima",
    description: "Descrição do evento Festa Gusttavo Lima.",
    date: DateTime(2021, 04, 17),
    local: "Morumbi",
    imageSrc: "assets/images/Festa.jpg",
    city: "São Paulo",
    uf: "SP",
    country: "Brasil",
  ),
  Event(
    id: 4,
    name: "Halloween",
    description: "Descrição do evento Halloween.",
    date: DateTime(2020, 10, 31),
    local: "Parque de Exposições",
    imageSrc: "assets/images/Halloween.jpg",
    city: "Divinópolis",
    uf: "MG",
    country: "Brasil",
  ),
  Event(
    id: 5,
    name: "Happi Holi",
    description: "Descrição do evento Happy Holi.",
    date: DateTime(2021, 07, 17),
    local: "Mineirão",
    imageSrc: "assets/images/HappyHoli.jpg",
    city: "Belo Horizonte",
    uf: "MG",
    country: "Brasil",
  ),
  Event(
    id: 6,
    name: "Atlético x Cruzeiro",
    description: "Descrição do evento Atlético x Cruzeiro.",
    date: DateTime(2021, 03, 20),
    local: "Mineirão",
    imageSrc: "assets/images/JogoFutebol.jpg",
    city: "Belo Horizonte",
    uf: "MG",
    country: "Brasil",
  ),
  Event(
    id: 7,
    name: "Sunset",
    description: "Descrição do evento Sunset.",
    date: DateTime(2021, 11, 20),
    local: "Salão de Festas",
    imageSrc: "assets/images/Sunset.jpg",
    city: "Porto Alegre",
    uf: "RS",
    country: "Brasil",
  ),
  Event(
    id: 8,
    name: "Palestra Polozi",
    description: "Descrição do evento Palestra de Inteligência Emocional.",
    date: DateTime(2021, 08, 21),
    local: "Escola Conquistadora",
    imageSrc: "assets/images/Palestra.jpg",
    city: "Porto Alegre",
    uf: "RS",
    country: "Brasil",
  ),
];