import 'package:flutter/material.dart';
import 'package:go_plus/entities/ticket.dart';
import 'package:go_plus/pages/available_ticket/ticket_card.dart';
import 'package:go_plus/size_config.dart';

class AvailableTicketBody extends StatefulWidget {
  @override
  _AvailableTicketBodyState createState() => _AvailableTicketBodyState();
}

class _AvailableTicketBodyState extends State<AvailableTicketBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          color: Colors.black,
          width: getProportionateScreenWidth(380),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Tickets",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0,
            ),
            child: GridView.builder(
              itemCount: tickets.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.65,
              ),
              itemBuilder: (context, index) => TicketCard(
                ticket: tickets[index],
              ),
            ),
          ),
        ),
      ]
    );
  }
}
