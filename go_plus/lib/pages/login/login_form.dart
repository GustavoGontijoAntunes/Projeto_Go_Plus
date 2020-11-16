import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_plus/components/alert.dart';
import 'package:go_plus/components/custom_suffix_icon.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/components/form_error.dart';
import 'package:go_plus/components/prefs.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/pages/forgot_password/forgot_password.dart';
import 'package:go_plus/pages/home/home.dart';
import 'package:go_plus/services/login_api.dart';
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
  bool _showProgress = false;

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
                activeColor: kPrimaryColor,
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
            press: () => {
              _onClickButton(context),
            },
            showProgress: _showProgress,
          ),
        ],
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(40),
      ],
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        email = newValue;
      },
      onChanged: (value){
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        else if(kEmailValidatorRegExp.hasMatch(value)){
          removeError(error: email);
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        else if(!kEmailValidatorRegExp.hasMatch(value)){
          addError(error: kInvalidEmailError);
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
      inputFormatters: [
        LengthLimitingTextInputFormatter(30),
      ],
      obscureText: true,
      onSaved: (newValue){
        password = newValue;
      },
      onChanged: (value){
        if (value.isNotEmpty) {
          removeError(error: kPasswordNullError);
        }
        else if(value.length >= 8){
          removeError(error: kShortPasswordError);
          return "";
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPasswordNullError);
          return "";
        }
        else if(value.length < 8){
          addError(error: kShortPasswordError);
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

  Future _onClickButton(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _showProgress = true;
      });

      var usuario = await LoginApi.login(email, password);

      //Se tudo estiver OK, ele entrará no APP - tela Home
      if(usuario != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(Home.routeName, (Route<dynamic> route) => false);
      }else{
        alert(context, kInvalidLoginError);
      }

      setState(() {
        _showProgress = false;
      });
    }
  }
}