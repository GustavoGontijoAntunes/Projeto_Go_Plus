import 'package:flutter/material.dart';
import 'package:go_plus/models/bottom_nav_bar.dart';
import 'package:go_plus/size_config.dart';

class Ticket extends StatefulWidget {
  static String routeName = "/ticket";

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
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
