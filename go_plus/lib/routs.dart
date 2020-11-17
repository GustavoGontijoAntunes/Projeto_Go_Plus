import 'package:flutter/cupertino.dart';
import 'package:go_plus/pages/available_ticket/available_ticket.dart';
import 'package:go_plus/pages/complete_profile/complete_profile.dart';
import 'package:go_plus/pages/driver_information/driver_information.dart';
import 'package:go_plus/pages/event_details/event_details.dart';
import 'package:go_plus/pages/forgot_password/forgot_password.dart';
import 'package:go_plus/pages/home/home.dart';
import 'package:go_plus/pages/login/login.dart';
import 'package:go_plus/pages/payment_successful/payment_successful.dart';
import 'package:go_plus/pages/profile/profile.dart';
import 'package:go_plus/pages/qr_code/qr_code.dart';
import 'package:go_plus/pages/register/register.dart';
import 'package:go_plus/pages/register_success/register_success.dart';
import 'package:go_plus/pages/splash/splash.dart';

import 'pages/purchased_ticket/purchased_ticket.dart';

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
  PurchasedTicket.routeName: (context) => PurchasedTicket(),
  EventDetails.routeName: (context) => EventDetails(),
  AvailableTicket.routeName: (context) => AvailableTicket(),
  DriverInformation.routeName: (context) => DriverInformation(),
  QrCodePage.routeName: (context) => QrCodePage(),
};