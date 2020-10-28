import 'package:flutter/cupertino.dart';
import 'package:go_plus/pages/complete_profile/complete_profile.dart';
import 'package:go_plus/pages/forgot_password/forgot_password.dart';
import 'package:go_plus/pages/home/home.dart';
import 'package:go_plus/pages/login/login.dart';
import 'package:go_plus/pages/payment_successful/payment_successful.dart';
import 'package:go_plus/pages/profile/profile.dart';
import 'package:go_plus/pages/register/register.dart';
import 'package:go_plus/pages/register_success/register_success.dart';
import 'package:go_plus/pages/splash/splash.dart';
import 'package:go_plus/pages/ticket/ticket.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Login.routeName: (context) => Login(),
  Register.routeName: (context) => Register(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  Home.routeName: (context) => Home(),
  //CompleteProfile.routeName: (context) => CompleteProfile(),
  RegisterSuccess.routeName: (context) => RegisterSuccess(),
  PaymentSuccessful.routeName: (context) => PaymentSuccessful(),
  Profile.routeName: (context) => Profile(),
  Ticket.routeName: (context) => Ticket(),
};