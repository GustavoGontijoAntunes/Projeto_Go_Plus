import 'package:flutter/material.dart';
import 'package:go_plus/pages/home/home.dart';
import 'package:go_plus/pages/profile/profile.dart';
import 'package:go_plus/pages/ticket/ticket.dart';

class NavItem{
  final int id;
  final String icon;
  final String destination;

  NavItem({this.id, this.icon, this.destination});

  bool destinationChecker() {
    if(destination != null) {
      return true;
    }
    return false;
  }
}

class NavItems extends ChangeNotifier{
  int selectedIndex = 1;

  void changeNavIndex({int index}){
    selectedIndex = index;

    notifyListeners();
  }


  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/icons/home.svg",
      destination: Home.routeName,
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/travel_ticket.svg",
      destination: Ticket.routeName,
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/profile.svg",
      destination: Profile.routeName,
    ),
  ];
}