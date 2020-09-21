import 'package:flutter/material.dart';
import 'package:go_plus/components/custom_suffix_icon.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/components/form_error.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/pages/forgot_password/forgot_password.dart';
import 'package:go_plus/pages/home/home.dart';
import 'package:go_plus/size_config.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}){
    if(errors.contains(error)){
      setState(() {
        errors.remove(error);
      });
    }
  }

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
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, ForgotPassword.routeName);
                },
                child: Text(
                  "Esqueci a senha",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Entrar",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                //Se tudo estiver OK, ele entrará no APP - tela Home
                Navigator.pushNamed(context, Home.routeName);
              }
            },
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
        if (value.isNotEmpty) {
          removeError(error: emailNullError);
        }
        else if(emailValidatorRegExp.hasMatch(value)){
          removeError(error: email);
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: emailNullError);
          return "";
        }
        else if(!emailValidatorRegExp.hasMatch(value)){
          addError(error: invalidEmailError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "E-mail",
        hintText: "Digite o seu e-mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
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
        if (value.isNotEmpty) {
          removeError(error: passwordNullError);
        }
        else if(value.length >= 8){
          removeError(error: shortPasswordError);
          return "";
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: passwordNullError);
          return "";
        }
        else if(value.length < 8){
          addError(error: shortPasswordError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Senha",
        hintText: "Digite a sua senha",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}