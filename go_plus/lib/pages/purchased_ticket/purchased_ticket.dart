import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_plus/models/bottom_nav_bar.dart';
import 'package:go_plus/pages/purchased_ticket/purchased_ticket_body.dart';
import 'package:go_plus/size_config.dart';

class PurchasedTicket extends StatelessWidget {
  static String routeName = "/purchased_ticket";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: buildAppBar(),
        body: PurchasedTicketBody(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  _body() {

  }

  buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Image.asset(
        "assets/images/Logo_3.png",
        height: 35,
      ),
      actions: [

      ],
    );
  }

  Future<bool> _onWillPop() {
    //Esta função está em branco para que o botão "Voltar" fique desabilitado.
  }
}
