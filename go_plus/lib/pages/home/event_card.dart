import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:go_plus/entities/event.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final Function press;
  const EventCard({
    Key key,
    this.event,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              event.imageSrc,
              height: 140,
              width: 170,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            event.name.toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontSize: 13
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1),
          child: Text(
            "Data: ${formatDate(event.date, [dd, '/', mm, '/', yyyy])}",
            style: TextStyle(
                fontSize: 11,
                height: 1
            ),
          ),
        )
      ],
    );
  }
}