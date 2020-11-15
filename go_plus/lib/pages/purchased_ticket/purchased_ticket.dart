import 'package:flutter/material.dart';
import 'package:go_plus/models/bottom_nav_bar.dart';
import 'package:go_plus/size_config.dart';

class PurchasedTicket extends StatefulWidget {
  static String routeName = "/purchased_ticket";

  @override
  _PurchasedTicketState createState() => _PurchasedTicketState();
}

class _PurchasedTicketState extends State<PurchasedTicket> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: buildAppBar(),
        body: _body(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  _body() {

  }

  buildAppBar() {

  }

  Future<bool> _onWillPop() {
    //Esta função está em branco para que o botão "Voltar" fique desabilitado.
  }
}
