import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/pages/available_ticket/available_ticket_body.dart';

class AvailableTicket extends StatelessWidget {
  static String routeName = "/available_ticket";
  final String eventName;

  const AvailableTicket({
    Key key,
    this.eventName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String event = eventName;
    return Scaffold(
      appBar: AppBar(
        title: Text(event),
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
      body: AvailableTicketBody(),
    );
  }
}