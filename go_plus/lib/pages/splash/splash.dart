import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Projetos_Flutter/go_plus/lib/pages/login/login.dart';
import 'package:go_plus/size_config.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin{
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(milliseconds: 3500);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage(){
    Navigator.pushNamed(context, Login.routeName);
  }

  @override
  void initState(){
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 2500),
    );
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.ease);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 187, 250, 1),
      body: _body(),
    );
  }

  Stack _body() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget> [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Image.asset(
              "assets/images/Logo_2.png",
              width: animation.value * 200,
              height: animation.value * 200,
            )
          ],
        )
      ],
    );
  }
}
