import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  String text;
  Color color;
  Function press;
  bool showProgress;

  DefaultButton({this.text, this.press, this.showProgress = false, this.color = kPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),

      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        onPressed: press,
        child: showProgress
          ? Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white,
              ),
            ),
      ),
    );
  }
}