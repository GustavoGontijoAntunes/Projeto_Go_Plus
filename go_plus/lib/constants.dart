import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(26, 187, 250, 1);
const primaryLightColor = Color.fromRGBO(255, 255, 255, 1);
const primaryGradientColor = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color.fromRGBO(26, 187, 250, 1),
    Color.fromRGBO(10, 87, 255, 1),
  ],
);
const textColor = Color.fromRGBO(117, 117, 117, 1);
const textAppBarColor = Color.fromRGBO(139, 139, 139, 1);

//Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Por favor, digite o seu e-mail";
const String invalidEmailError = "Por favor, digite um e-mail válido";
const String passwordNullError = "Por favor, digite a sua sennha";
const String shortPasswordError = "A senha é muito pequena";
const String matchPasswordError = "As senhas não são iguais";