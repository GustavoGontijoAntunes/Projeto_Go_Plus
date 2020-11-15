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
    description: "Descrição do evento Funeral da Porca. Você nunca sabe o que esperar de uma arte performática. É tão original e única como o artista, com pouquíssimas coisas em comum entre um evento e outro, e que consegue alinhar sua apresentação artística com qualquer outro contexto, ao vivo e perante seu público-alvo.",
    date: DateTime(2021, 01, 31, 16, 00),
    local: "Parque de Exposições",
    imageSrc: "assets/images/Funeral_da_Porca.jpg",
    city: "Itaúna",
    uf: "MG",
    country: "Brasil",
  ),
  Event(
    id: 2,
    name: "Carnaval 2021",
    description: "Descrição do evento Carnaval. Um evento matutino para quando o organizador tem um anúncio ou lançamento para apresentar. Ótimo para quem quer atingir um público-alvo de negócios que não conseguiria participar de um evento em horário de expediente ou após o trabalho.",
    date: DateTime(2021, 02, 15, 09, 00),
    local: "Praia de Copacabana",
    imageSrc: "assets/images/Carnaval.png",
    city: "Rio de Janeiro",
    uf: "RJ",
    country: "Brasil",
  ),
  Event(
    id: 3,
    name: "Festa Gusttavo Lima",
    description: "Descrição do evento Festa Gusttavo Lima. O clássico evento do “corte de fita” conta com a participação do prefeito da cidade e um convidado importante ou famoso que vem inaugurar um novo espaço público, como uma escola ou biblioteca. É uma ótima maneira de reunir a comunidade e conhecer as novas instalações.",
    date: DateTime(2021, 04, 17, 20, 30),
    local: "Morumbi",
    imageSrc: "assets/images/Festa.jpg",
    city: "São Paulo",
    uf: "SP",
    country: "Brasil",
  ),
  Event(
    id: 4,
    name: "Halloween",
    description: "Descrição do evento Halloween. Apresentação não é sinônimo de “Power Point”, ao contrário do entendimento da maioria dos oradores de conferências. Mas, tipicamente uma demonstração, palestra ou discurso destinado à informar, persuadir ou passar uma mensagem. Embora geralmente faça parte de uma conferência ou outro evento maior, não há motivos para ter apenas uma apresentação como destaque de seu evento. A não ser que a sua apresentação seja teatral!",
    date: DateTime(2020, 10, 31, 19, 00),
    local: "Parque de Exposições",
    imageSrc: "assets/images/Halloween.jpg",
    city: "Divinópolis",
    uf: "MG",
    country: "Brasil",
  ),
  Event(
    id: 5,
    name: "Happi Holi",
    description: "Descrição do evento Happy Holi. Nosso modelo mais conhecido de debate está no âmbito político, mas há muito além disso! São diversos temas que nos permitem assistir a oradores talentosos e apaixonados que defendem seus aprendizados, valores e ideais. É um evento que pode causar uma enorme impressão, influenciar eleições, levar credibilidade a causas e fazer os espectadores questionarem algumas ideias próprias.",
    date: DateTime(2021, 07, 17, 15, 30),
    local: "Mineirão",
    imageSrc: "assets/images/HappyHoli.jpg",
    city: "Belo Horizonte",
    uf: "MG",
    country: "Brasil",
  ),
  Event(
    id: 6,
    name: "Atlético x Cruzeiro",
    description: "Descrição do evento Atlético x Cruzeiro. Se você quer dar uma festa em casa sem queixas sobre o volume da música, esta pode ser a solução! Em vez de colocar os alto-falantes no último volume, cada participante de uma discoteca silenciosa recebe fones de ouvido e dança com as músicas que ouvir. Parece engraçado pra quem nunca fez antes, no mínimo inusitado!",
    date: DateTime(2021, 03, 20, 16, 00),
    local: "Mineirão",
    imageSrc: "assets/images/JogoFutebol.jpg",
    city: "Belo Horizonte",
    uf: "MG",
    country: "Brasil",
  ),
  Event(
    id: 7,
    name: "Sunset",
    description: "Descrição do evento Sunset. Feiras de negócios são semelhantes às de consumidor, mas geralmente restritas a profissionais e não abertas ao público. Esses eventos têm como objetivo principal a venda de bens ou serviços de alto valor a um público altamente seleto. Entenda mais sobre esse tipo de evento aqui.",
    date: DateTime(2021, 11, 20, 14, 00),
    local: "Salão de Festas",
    imageSrc: "assets/images/Sunset.jpg",
    city: "Porto Alegre",
    uf: "RS",
    country: "Brasil",
  ),
  Event(
    id: 8,
    name: "Palestra Polozi",
    description: "Descrição do evento Palestra de Inteligência Emocional. Marcada pelas barraquinhas em formato de feira, com grande diversidade de jogos, comidas, bebidas e atrações, a festa beneficente tem como principal objetivo reunir e mobilizar a comunidade para angariar fundos em prol de uma causa comunitária, uma instituição ou até uma associação de bairro.",
    date: DateTime(2021, 08, 21, 08, 00),
    local: "Escola Conquistadora",
    imageSrc: "assets/images/Palestra.jpg",
    city: "Florianópolis",
    uf: "SC",
    country: "Brasil",
  ),
];