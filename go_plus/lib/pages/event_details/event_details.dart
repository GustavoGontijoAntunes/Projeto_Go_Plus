import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/entities/event.dart';
import 'package:go_plus/pages/available_ticket/available_ticket.dart';
import 'package:go_plus/pages/purchased_ticket/purchased_ticket.dart';
import 'package:go_plus/size_config.dart';

class EventDetails extends StatelessWidget {
  static String routeName = "/event_details";
  final Event event;

  const EventDetails({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Detalhes do Evento",
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/favorite.svg",
              height: 25,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/share.svg",
              height: 25,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: Column(
          children: [
            Image.asset(
              event.imageSrc,
              height: 400,
              width: 415,
              fit: BoxFit.cover,
            ),
            _eventTitle(),
            _dateEvent(),
            _localEvent(),
            _eventDescription(),
            _buttonTicket(context),
          ],
        ),
      ),
    );
  }

  _eventTitle() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Text(
            event.name.toUpperCase(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  _dateEvent() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 10),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/calendar.svg",
              color: Colors.black,
              height: 20,
            ),
            SizedBox(width: 10),
            Text(
              "${formatDate(event.date, [dd, '/', mm, '/', yyyy, ' - ', HH, ':', nn])}",
              style: TextStyle(
                  fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _localEvent() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/place.svg",
              color: Colors.black,
              height: 20,
            ),
            SizedBox(width: 10),
            Text(
              event.local + " - " + event.city + " (" + event.uf + ")",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _eventDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 20),
          child: Text(
            "Descrição do Evento".toUpperCase(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Text(
            event.description,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  _buttonTicket(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: DefaultButton(
          text: "Ver Tickets",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AvailableTicket(eventName: event.name)),
            );
          },
          showProgress: false,
          color: kGreenColor,
        ),
      ),
    );
  }
}
