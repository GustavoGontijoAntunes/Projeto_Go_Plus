import 'package:flutter/material.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/pages/login/login.dart';
import 'package:go_plus/size_config.dart';

class RegisterSuccess extends StatelessWidget {
  static String routeName = "/register_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        automaticallyImplyLeading: false,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/Success.png",
          height: SizeConfig.screenHeight * 0.4,
          width: getProportionateScreenWidth(400),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Conta Criada com Sucesso!",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Voltar para o Login",
            press: (){
              Navigator.pushNamed(context, Login.routeName);
            },
            showProgress: false,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
