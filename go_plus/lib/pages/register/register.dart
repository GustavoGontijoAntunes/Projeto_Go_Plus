import 'package:flutter/material.dart';
import 'package:go_plus/components/social_card.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/pages/register/register_form.dart';
import 'package:go_plus/size_config.dart';

class Register extends StatelessWidget {
  static String routeName = "/register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
      ),
      body: _body(),
    );
  }

  _body() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Text(
                "Registrar Conta",
                style: headinStyle,
              ),
              Text(
                "Complete as informações ou continue \ncom uma rede social",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              RegisterForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: "assets/icons/google-icon.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/facebook-2.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                "Ao continuar, você concorda com os \nnossos Termos e Condições",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
