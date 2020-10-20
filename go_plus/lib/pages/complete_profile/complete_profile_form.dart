import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_plus/components/alert.dart';
import 'package:go_plus/components/custom_suffix_icon.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/components/form_error.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/pages/register_success/register_success.dart';
import 'package:go_plus/services/register_api.dart';
import 'package:go_plus/services/usuario.dart';
import 'package:go_plus/size_config.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CompleteProfileForm extends StatefulWidget {
  String email;
  String password;

  CompleteProfileForm(this.email, this.password);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState(this.email, this.password);
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  Usuario user = new Usuario();
  final List<String> errors = [];
  var maskFormatter = new MaskTextInputFormatter(mask: '(##) #####-####', filter: { "#": RegExp(r'[0-9]') });

  _CompleteProfileFormState(String email, String password){
    user.email = email;
    user.password = password;
  }

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
            press: () => _onClickButton(context),
          ),
        ],
      ),
    );
  }

  firstNameFormField() {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(30),
      ],
      onSaved: (newValue) {
        user.firstName = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
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
      inputFormatters: [
        LengthLimitingTextInputFormatter(30),
      ],
      onSaved: (newValue) {
        user.lastName = newValue;
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
      inputFormatters: [maskFormatter],
      onSaved: (newValue) {
        user.phoneNumber = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
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
      inputFormatters: [
        LengthLimitingTextInputFormatter(30),
      ],
      onSaved: (newValue) {
        user.city = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kCityNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kCityNullError);
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

  Future _onClickButton(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      var registro = await RegisterApi.save(user);
      print("registro: $registro");

      if(registro) {
        Navigator.pushNamed(context, RegisterSuccess.routeName);
      } else{
        alert(context, "Cadastro não pôde ser realizado!");
      }
    }
  }
}
