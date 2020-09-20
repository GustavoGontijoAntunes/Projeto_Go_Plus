import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page){
  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

pop(context, String tela){
  return Navigator.pop(context, tela);
}