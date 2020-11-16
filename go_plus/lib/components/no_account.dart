import 'package:flutter/material.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/pages/forgot_password/forgot_password.dart';
import 'package:go_plus/pages/login/login.dart';
import 'package:go_plus/pages/register/register.dart';
import 'package:go_plus/size_config.dart';

class NoAccount extends StatelessWidget {
  const NoAccount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Você ainda não possui uma conta? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(12),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Register.routeName);
          },
          child: Text(
            "Crie uma conta",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(12),
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
