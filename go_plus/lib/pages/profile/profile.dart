import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/models/bottom_nav_bar.dart';
import 'package:go_plus/pages/login/login.dart';
import 'package:go_plus/pages/profile/info.dart';
import 'package:go_plus/pages/profile/profile_menu_item.dart';
import 'package:go_plus/services/profile_api.dart';
import 'package:go_plus/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  static String routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: SizedBox(),
      centerTitle: true,
      title: Text(
        "Perfil",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () {},
          child: Text(
            "Editar",
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.defaultSize * 1.3,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Info(
            image: "assets/images/Profile.jpg",
            name: "Gustavo Antunes",
            email: "gustavo_antunes07@hotmail.com",
          ),
          SizedBox(height: SizeConfig.defaultSize * 2),
          ProfileMenuItem(
            iconSrc: "assets/icons/favorite.svg",
            title: "Eventos Favoritos",
            color: Colors.red,
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/premium.svg",
            title: "Tornar-se Premium",
            color: Colors.yellow,
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/info.svg",
            title: "Ajuda",
            color: kPrimaryColor,
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/Log out.svg",
            title: "Sair",
            color: Colors.red,
            press: () async {
              return showDialog<bool>(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  title: Text("Sair"),
                  content: Text("Você realmente deseja sair da sua conta?"),
                  actions: [
                    RaisedButton(
                      child: Text("Sim",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                      color: kPrimaryColor,
                      onPressed: (){
                        Navigator.pushNamedAndRemoveUntil(context, Login.routeName, (_) => false);
                      },
                    ),
                    RaisedButton(
                      child: Text("Não",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                      color: kPrimaryColor,
                      onPressed: (){
                        Navigator.pop(context, false);
                      },
                    )
                  ],
                )
              );
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _onWillPop() {
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

    return usuario;
  }
}

