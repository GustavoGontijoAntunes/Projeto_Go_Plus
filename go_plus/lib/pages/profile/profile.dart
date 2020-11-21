import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/entities/user.dart';
import 'package:go_plus/models/bottom_nav_bar.dart';
import 'package:go_plus/pages/login/login.dart';
import 'package:go_plus/pages/profile/info.dart';
import 'package:go_plus/pages/profile/profile_menu_item.dart';
import 'package:go_plus/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  static String routeName = "/profile";


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Future<User> futureUser = User.getUser();
  _ProfileState();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: buildAppBar(),
        body: _body(futureUser),
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

  _body(Future<User> futureUser) {
    //Future<User> usuario = ProfileApi.getProfile("", 0);

    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder<User>(
            future: futureUser,
            builder: (context, snapshot) {
              User user = snapshot.data;
              return user != null ? _infoUser(user) : Container();
            },
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
            title: "Upgrade Premium",
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

  Info _infoUser(User user) {
    return Info(
      image: "assets/images/Profile.jpg",
      name: user.firstName + " " + user.lastName,
      email: user.email,
    );
  }

  Future<bool> _onWillPop() {
    //Esta função está em branco para que o botão "Voltar" fique desabilitado.
  }
}