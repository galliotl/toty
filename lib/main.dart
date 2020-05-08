import 'package:flutter/material.dart';
import 'package:toty/config/routes.dart';
import 'package:toty/pages/AccountPage.dart';
import 'package:toty/pages/HomePage.dart';
import 'package:toty/pages/LoginPage.dart';
import 'package:toty/style/style.dart';

void main() {
  runApp(Toty());
}

class Toty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      initialRoute: homeRoute,
      routes: {
        homeRoute: (context) => HomePage(),
        accountRoute: (context) => AccountPage(),
        loginRoute: (context) => LoginPage(),
      },
    );
  }
}
