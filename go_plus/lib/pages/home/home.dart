import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/models/bottom_nav_bar.dart';
import 'package:go_plus/pages/home/home_body.dart';
import 'package:go_plus/pages/payment_successful/payment_successful.dart';
import 'package:go_plus/services/profile_api.dart';
import 'package:go_plus/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void initState() {
    _searchUser();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: buildAppBar(),
        body: HomeBody(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Image.asset(
        "assets/images/Logo_3.png",
        height: 35,
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/notification_2.svg",
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, PaymentSuccessful.routeName);
          },
        ),
        SizedBox(
          width: SizeConfig.defaultSize * 0.5,
        )
      ],
    );
  }

  Future<bool> _onWillPop() async{
    //Esta função está em branco para que o botão "Voltar" fique desabilitado.
  }

  Future _searchUser() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var id = prefs.get('id');

    var usuario = await ProfileApi.profile(token, id);

    //Se tudo estiver OK, ele entrará no APP - tela Home
    if(usuario != null) {
      print(usuario);
    }else{
      print("ERRO");
    }
  }
}

