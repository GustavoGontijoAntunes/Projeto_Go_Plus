import 'package:flutter/material.dart';
import 'package:go_plus/pages/splash.dart';
import 'package:go_plus/routs.dart';
import 'package:go_plus/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }

  ThemeData themeData() {
    return theme();
  }
}