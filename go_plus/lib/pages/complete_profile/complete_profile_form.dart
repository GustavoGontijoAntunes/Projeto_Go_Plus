import 'package:flutter/material.dart';
import 'package:go_plus/components/custom_suffix_icon.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/components/form_error.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/pages/login/login.dart';
import 'package:go_plus/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String phoneNumber;
  String city;
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
          firstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          lastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          phoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          cityFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continuar",
            press: (){
              if(_formKey.currentState.validate()){
                Navigator.pushNamed(context, Login.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  firstNameFormField() {
    return TextFormField(
      onSaved: (newValue) {
        firstName = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: nameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: nameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Primeiro Nome",
        hintText: "Digite o seu primeiro nome",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  lastNameFormField() {
    return TextFormField(
      onSaved: (newValue) {
        lastName = newValue;
      },
      decoration: InputDecoration(
        labelText: "Sobrenome",
        hintText: "Digite o seu sobrenome",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  phoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) {
        phoneNumber = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: phoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: phoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Telefone",
        hintText: "Digite o seu nº de telefone",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  cityFormField() {
    return TextFormField(
      onSaved: (newValue) {
        city = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: cityNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: cityNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Cidade",
        hintText: "Digite o nome da sua cidade",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }
}
