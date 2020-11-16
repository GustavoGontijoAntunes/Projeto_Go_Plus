import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_plus/components/custom_suffix_icon.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/entities/event.dart';
import 'package:go_plus/entities/event_categories.dart';
import 'package:go_plus/pages/event_details/event_details.dart';
import 'package:go_plus/pages/home/event_card.dart';
import 'package:intl/intl.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String wordSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _searchFormField(),
        EventCategories(),
        SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              itemCount: events.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
              ),
              itemBuilder: (context, index) =>
                EventCard(
                  event: events[index],
                  press: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetails(
                          event: events[index],
                        ),
                      )
                    ),
                  },
                ),
            ),
          )
        ),
        SizedBox(height: 20),
      ]
    );
  }

  _searchFormField() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (newValue) {
          wordSearch = newValue;
        },
        decoration: InputDecoration(
          hintText: "Pesquisar...",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/search.svg"),
        ),
      ),
    );
  }
}
