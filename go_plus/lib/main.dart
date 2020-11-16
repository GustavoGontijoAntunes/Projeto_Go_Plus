import 'package:flutter/material.dart';
import 'package:go_plus/models/nav_item.dart';
import 'file:///C:/Projetos_Flutter/go_plus/lib/pages/splash/splash.dart';
import 'package:go_plus/routs.dart';
import 'package:go_plus/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}