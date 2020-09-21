import 'package:flutter/cupertino.dart';
import 'package:go_plus/pages/complete_profile/complete_profile.dart';
import 'package:go_plus/pages/forgot_password/forgot_password.dart';
import 'package:go_plus/pages/home/home.dart';
import 'package:go_plus/pages/login/login.dart';
import 'package:go_plus/pages/register/register.dart';
import 'package:go_plus/pages/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Login.routeName: (context) => Login(),
  Register.routeName: (context) => Register(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  Home.routeName: (context) => Home(),
  CompleteProfile.routeName: (context) => CompleteProfile(),
};