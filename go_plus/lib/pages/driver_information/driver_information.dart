import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/entities/driver.dart';
import 'package:go_plus/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DriverInformation extends StatefulWidget {
  static String routeName = "/driver_information";
  final int id;

  const DriverInformation({
    Key key,
    this.id,
  }): super(key: key);

  @override
  _DriverInformationState createState() => _DriverInformationState();
}

class _DriverInformationState extends State<DriverInformation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drivers[widget.id].ticketName),
      ),
      body: _body(),
    );
  }

  _body(){
    int _currentImage = 0;
    List<String> images = [
      drivers[widget.id].img1,
      drivers[widget.id].img2,
      drivers[widget.id].img3,
      drivers[widget.id].img4,
    ];

    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Nota:",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 15),
                    RatingBarIndicator(
                      rating: drivers[widget.id].grade,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child: Text(
                        "Visualizar Avaliações",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 10,
                        ),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardStatistics(drivers[widget.id].numberTrips, "VIAGENS"),
                    _cardStatistics(drivers[widget.id].numberMonthTrips, "MESES"),
                    _cardStatistics(drivers[widget.id].numberKmTrips, "KM"),
                  ],
                ),
                SizedBox(height: 20),
                _titleCard("MOTORISTA"),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kWordsColor,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _rowInfo("Nome: ", drivers[widget.id].driverName),
                            _rowInfo("Idade: ", drivers[widget.id].driverAge.toString()),
                            _rowInfo("Tipo CNH: ", drivers[widget.id].typeCNH),
                            _rowInfo("Contato: ", drivers[widget.id].phoneNumber),
                            Row(
                              children: [
                                _rowInfo(
                                  "Cidade: ", drivers[widget.id].city + " (" +
                                  drivers[widget.id].uf + ") "
                                ),
                                SizedBox(width: 10),
                                Image.asset(
                                  "assets/images/Brasil.png",
                                  width: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 5),
                        Column(
                          children: [
                            _profile(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _titleCard("VEÍCULO"),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kWordsColor,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Fotos:"),
                            _carouselPhotosVan(images),
                            _rowInfo("Modelo: ", drivers[widget.id].vanModel),
                            _rowInfo("Cor: ", drivers[widget.id].vanColor),
                            _rowInfo("Capacidade: ", drivers[widget.id].vanOccupation.toString() + " lugares"),
                            _rowInfo("Contato: ", drivers[widget.id].licensePlateVan),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        )
      ),
    );
  }

  CarouselSlider _carouselPhotosVan(List<String> images) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: images.map((item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                ],
              )
          ),
        ),
      )).toList(),
    );
  }

  _rowInfo(String label, String info) {
    return Row(
      children: [
        Text(label),
        Text(info),
      ],
    );
  }

  _profile(){
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      margin: EdgeInsets.only(bottom: defaultSize),
      height: defaultSize * 8,
      width: defaultSize * 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xFFD1D4D4),
          width: defaultSize * 0.5,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/Profile.jpg"),
        ),
      ),
    );
  }

  _titleCard(String tile) {
    return Container(
      color: Colors.black,
      width: getProportionateScreenWidth(380),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          tile,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  _cardStatistics(int parameter, String label) {
    return Container(
      width: 100,
      height: 70,
      color: kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            parameter.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
