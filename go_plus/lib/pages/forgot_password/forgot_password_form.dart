import 'package:flutter/material.dart';
import 'package:go_plus/components/custom_suffix_icon.dart';
import 'package:go_plus/components/default_button.dart';
import 'package:go_plus/components/form_error.dart';
import 'package:go_plus/components/no_account.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/size_config.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) {
              email = newValue;
            },
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(emailNullError)) {
                setState(() {
                  errors.remove(emailNullError);
                });
                return "";
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(invalidEmailError)) {
                setState(() {
                  errors.remove(invalidEmailError);
                });
                return "";
              }

              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(emailNullError)) {
                setState(() {
                  errors.add(emailNullError);
                });
                return "";

              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(invalidEmailError)) {
                setState(() {
                  errors.add(invalidEmailError);
                });

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
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Enviar",
            press: () {
              if(_formKey.currentState.validate()){
                //Enviar e-mail de recuperação da senha
                print("E-mail enviado!");
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccount(),
        ],
      ),
    );
  }
}
