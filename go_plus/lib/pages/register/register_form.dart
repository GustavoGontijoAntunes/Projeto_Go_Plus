import 'package:flutter/material.dart';
import 'package:go_plus/components/custom_suffix_icon.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/components/form_error.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/pages/complete_profile/complete_profile.dart';
import 'package:go_plus/size_config.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirm_password;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
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
          confirmPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continuar",
            press: (){
              if(_formKey.currentState.validate()){
                Navigator.pushNamed(context, CompleteProfile.routeName);
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
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (kEmailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!kEmailValidatorRegExp.hasMatch(value)) {
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
      obscureText: true,
      onSaved: (newValue) {
        password = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPasswordNullError);
        }
        else if (value.length >= 8) {
          removeError(error: kShortPasswordError);
          return "";
        }

        password = value;

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPasswordNullError);
          return "";
        }
        else if (value.length < 8) {
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

  TextFormField confirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {
        confirm_password = newValue;
      },
      onChanged: (value) {
        if (password == confirm_password) {
          removeError(error: kMatchPasswordError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        }
        else if (password != value) {
          addError(error: kMatchPasswordError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirmar Senha",
        hintText: "Digite a sua senha novamente",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
