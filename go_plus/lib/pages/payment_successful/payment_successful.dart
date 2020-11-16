import 'package:flutter/material.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/pages/home/home.dart';
import 'package:go_plus/pages/login/login.dart';
import 'package:go_plus/size_config.dart';

class PaymentSuccessful extends StatefulWidget {
  static String routeName = "/payment_successful";

  @override
  _PaymentSuccessfulState createState() => _PaymentSuccessfulState();
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          automaticallyImplyLeading: false,
        ),
        body: _body(context),
      ),
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
          "Compra Efetuada com Sucesso!",
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
            text: "Voltar para o início",
            press: (){
              Navigator.pushNamed(context, Home.routeName);
            },
            showProgress: false,
          ),
        ),
        Spacer(),
      ],
    );
  }

  Future<bool> _onWillPop() async{/*
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text("Voltar"),
          content: Text("Você deseja voltar para a tela de início?"),
          actions: [
            RaisedButton(
              child: Text("Sim",
                style: TextStyle(
                    color: Colors.white),
              ),
              color: kPrimaryColor,
              onPressed: (){
                Navigator.pushNamed(context, Home.routeName);
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
    );*/
  }
}
