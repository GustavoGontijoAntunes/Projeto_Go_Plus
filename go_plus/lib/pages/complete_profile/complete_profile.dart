import 'package:flutter/material.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/pages/complete_profile/complete_profile_form.dart';
import 'package:go_plus/size_config.dart';

class CompleteProfile extends StatelessWidget {
  static String routeName = "/complete_profile";
  String email;
  String password;

  CompleteProfile(this.email, this.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cria conta"),
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
              SizedBox(height: SizeConfig.screenHeight * 0.00), // 0%
              Text(
                "Complete seu perfil",
                style: kHeadingStyle,
              ),
              Text(
                "Complete as informações ou continue \ncom uma rede social",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              CompleteProfileForm(this.email, this.password),
              SizedBox(height: getProportionateScreenHeight(30)),
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
