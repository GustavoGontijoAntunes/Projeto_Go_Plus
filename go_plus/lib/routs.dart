import 'package:flutter/cupertino.dart';
import 'package:go_plus/pages/login.dart';
import 'package:go_plus/pages/splash.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Login.routeName: (context) => Login(),
};