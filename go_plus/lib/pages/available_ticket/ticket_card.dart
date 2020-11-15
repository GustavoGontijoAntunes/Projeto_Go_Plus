import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_plus/components/alert.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/components/default_disable_short_button.dart';
import 'package:go_plus/components/default_short_button.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/entities/ticket.dart';
import 'package:go_plus/pages/driver_information/driver_information.dart';
import 'package:go_plus/pages/payment_successful/payment_successful.dart';
import 'package:go_plus/size_config.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final Function press;
  const TicketCard({
    Key key,
    this.ticket,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return AspectRatio(
      aspectRatio: 1.65,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: kWordsColor, width: 2)),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize * 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        ticket.name,
                        style: TextStyle(
                          fontSize: defaultSize * 2.2,
                        )
                      ),
                      SizedBox(width: 40),
                      Text(
                        "Nota: ",
                        style: TextStyle(
                          fontSize: 15
                        ),
                      ),
                      SizedBox(width: 5),
                      RatingBarIndicator(
                        rating: ticket.grade,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 21.0,
                        direction: Axis.horizontal,
                      ),
                      Text(" (" + ticket.grade.toString() + ")"),
                    ]
                  ),
                  Divider(),
                  Text("Horário: " + "${formatDate(ticket.exitDate, [HH, ':', nn])}"),
                  Text("Data: " + "${formatDate(ticket.exitDate, [dd, '/', mm, '/', yyyy])}"),
                  Text("Local: " + ticket.exitLocation + " - " +
                      ticket.exitCity + " (" + ticket.exitUf + ")" +
                      " - " + ticket.exitCountry
                  ),
                  Text("Tipo: " + ticket.travelType),
                  Text("Preço: R\$ " + ticket.price.toString() + "0" +
                      " (+ R\$ " + (ticket.price * 0.10).toString() + "0)"),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Ocupação:",
                            style: TextStyle(
                              color: ticket.occupation < ticket.totalOccupation ? Colors.green : Colors.red,
                            ),
                          ),
                          Text(
                              ticket.occupation.toString() + " / " + ticket.totalOccupation.toString(),
                            style: TextStyle(
                              color: ticket.occupation < ticket.totalOccupation ? Colors.green : Colors.red,
                            ),
                          ),
                        ]
                      ),
                      SizedBox(width: 15),
                      ticket.occupation < ticket.totalOccupation ?
                        DefaultShortButton(
                          text: "Comprar",
                          press: () => {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Comprar"),
                                  content: Text(
                                    "Você deseja comprar o ticket \"" + ticket.name.trim() +
                                    "\" por R\$ " + (ticket.price + (ticket.price * 0.10)).toString() + "0?"
                                  ),
                                  actions: [
                                    RaisedButton(
                                      child: Text("Sim",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                      color: kPrimaryColor,
                                      onPressed: (){
                                        Navigator.pushNamedAndRemoveUntil(context, PaymentSuccessful.routeName, (_) => false);
                                      },
                                    ),
                                    RaisedButton(
                                      child: Text("Não",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                      color: kPrimaryColor,
                                      onPressed: (){
                                        Navigator.pop(context, false);
                                      },
                                    )
                                  ],
                                );
                              },
                            ),
                          },
                        )
                      : DefaultDisableShortButton(text: "Comprar"),
                      SizedBox(width: 15),
                      DefaultShortButton(
                        text: "Informações",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DriverInformation()),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: defaultSize * 0.5),
          ],
        ),
      ),
    );
  }
}
