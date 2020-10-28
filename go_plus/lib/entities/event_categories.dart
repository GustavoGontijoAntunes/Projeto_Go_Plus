import 'package:flutter/material.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/size_config.dart';

class EventCategories extends StatefulWidget {
  @override
  _EventCategoriesState createState() => _EventCategoriesState();
}

class _EventCategoriesState extends State<EventCategories> {
  List<String> categories = [
    "Todos",
    "Festas",
    "Palestras",
    "Esportes",
    "Seminários"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.defaultSize * 2,
      ),
      child: SizedBox(
        height: SizeConfig.defaultSize * 3.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategorieItem(index),
        ),
      ),
    );
  }

  Widget buildCategorieItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2,
          vertical: SizeConfig.defaultSize * 0.5,
        ),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Color(0xFFE9E9E9).withOpacity(0.56) : Colors.transparent,
          borderRadius: BorderRadius.circular(
            SizeConfig.defaultSize * 1.6,
          ),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? kPrimaryColor : kWordsColor,
          ),
        ),
      ),
    );
  }
}