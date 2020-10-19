import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_plus/components/custom_suffix_icon.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/size_config.dart';

class Home extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: _body(),
      bottomNavigationBar: Container(
        color: Colors.red,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: getProportionateScreenHeight(60),
                width: getProportionateScreenWidth(60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [kDefaultShadow],
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(""),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _body() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: getProportionateScreenWidth(40),
          child: Container(
            width: getProportionateScreenWidth(313),
            height: getProportionateScreenHeight(50),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Pesquisar Eventos",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
