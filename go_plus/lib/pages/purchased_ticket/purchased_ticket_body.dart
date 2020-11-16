import 'package:flutter/material.dart';
import 'package:go_plus/entities/user_ticket.dart';
import 'package:go_plus/entities/ticket.dart';
import 'package:go_plus/pages/available_ticket/ticket_card.dart';
import 'package:go_plus/pages/purchased_ticket/purchased_ticket_card.dart';
import 'package:go_plus/size_config.dart';

class PurchasedTicketBody extends StatefulWidget {
  @override
  _PurchasedTicketBodyState createState() => _PurchasedTicketBodyState();
}

class _PurchasedTicketBodyState extends State<PurchasedTicketBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            color: Colors.white,
            width: getProportionateScreenWidth(380),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Meus Tickets",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
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
                itemCount: userTicket.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => PurchasedTicketCard(
                  userTicket: userTicket[index],
                ),
              ),
            ),
          ),
        ]
    );
  }
}
