import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_plus/components/alert.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/components/default_disable_short_button.dart';
import 'package:go_plus/components/default_short_button.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/entities/event.dart';
import 'package:go_plus/entities/user_ticket.dart';
import 'package:go_plus/entities/ticket.dart';
import 'package:go_plus/pages/driver_information/driver_information.dart';
import 'package:go_plus/pages/payment_successful/payment_successful.dart';
import 'package:go_plus/pages/profile/profile.dart';
import 'package:go_plus/pages/qr_code/qr_code.dart';
import 'package:go_plus/size_config.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PurchasedTicketCard extends StatelessWidget {
  final UserTicket userTicket;
  final Function press;
  const PurchasedTicketCard({
    Key key,
    this.userTicket,
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
          //border: Border(bottom: BorderSide(color: kWordsColor, width: 2)),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: kWordsColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      userTicket.imageSrc,
                      fit: BoxFit.cover,
                      width: getProportionateScreenWidth(220),
                      height: getProportionateScreenHeight(274.5),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          userTicket.ticketName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        _dateEvent(),
                        SizedBox(height: 10),
                        _localEvent(),
                        SizedBox(height: 10),
                        GestureDetector(
                          child: QrImage(
                            data: userTicket.qrCode,
                            version: QrVersions.auto,
                            size: 60.0,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => QrCodePage(qrCode: userTicket.qrCode)),
                            );
                          },
                        ),
                        Text(
                          "Clique para expandir",
                          style: TextStyle(
                            fontSize: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _dateEvent() {
    return Container(
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/calendar.svg",
            color: Colors.black,
            height: 12,
          ),
          SizedBox(width: 10),
          Text(
            "${formatDate(userTicket.date, [dd, '/', mm, '/', yyyy, ' - ', HH, ':', nn])}",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  _localEvent() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/icons/place.svg",
            color: Colors.black,
            height: 12,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              userTicket.local + " - " + userTicket.city + " (" + userTicket.uf + ")",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      )
    );
  }
}
