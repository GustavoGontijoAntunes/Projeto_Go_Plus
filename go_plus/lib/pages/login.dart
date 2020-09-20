import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_plus/components/custom_surffix_icon.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/components/form_error.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/size_config.dart';

class Login extends StatelessWidget {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Criar conta",
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Bem-vindo de volta!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Insira seu e-mail e sua senha \nou continue com sua rede social.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                LoginFormulario(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: (){},
                    ),
                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: (){},
                    ),
                    SocialCard(
                      icon: "assets/icons/twitter.svg",
                      press: (){},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Você ainda não possui uma conta? ",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12),
                      ),
                    ),
                    Text(
                      "Crie uma conta",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12),
                        color: primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
        ),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}

class LoginFormulario extends StatefulWidget {
  @override
  _LoginFormularioState createState() => _LoginFormularioState();
}

class _LoginFormularioState extends State<LoginFormulario> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          passwordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: primaryColor,
                onChanged: (value){
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Lembrar-me"),
              Spacer(),
              Text(
                "Esqueci a senha",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Entrar",
            press: () {
              if(_formKey.currentState.validate()){
                _formKey.currentState.save();
              }
            }
          ),
        ],
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        email = newValue;
      },
      onChanged: (value){
        if (value.isNotEmpty && errors.contains(emailNullError)) {
          setState(() {
            errors.remove(emailNullError);
          });
        }
        else if(emailValidatorRegExp.hasMatch(value) && errors.contains(invalidEmailError)){
          setState(() {
            errors.remove(invalidEmailError);
          });
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(emailNullError)) {
          setState(() {
            errors.add(emailNullError);
          });
        }
        else if(!emailValidatorRegExp.hasMatch(value) && !errors.contains(invalidEmailError)){
          setState(() {
            errors.add(invalidEmailError);
          });
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "E-mail",
        hintText: "Digite o seu e-mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue){
        password = newValue;
      },
      onChanged: (value){
        if (value.isNotEmpty && errors.contains(passwordNullError)) {
          setState(() {
            errors.remove(passwordNullError);
          });
        }
        else if(value.length >= 8 && errors.contains(shortPasswordError)){
          setState(() {
            errors.remove(shortPasswordError);
          });
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(passwordNullError)) {
          setState(() {
            errors.add(passwordNullError);
          });
        }
        else if(value.length < 8 && !errors.contains(shortPasswordError)){
          setState(() {
            errors.add(shortPasswordError);
          });
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Senha",
        hintText: "Digite a sua senha",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}