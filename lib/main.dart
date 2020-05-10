import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/config/routes.dart';
import 'package:toty/pages/AccountPage.dart';
import 'package:toty/pages/homePage/HomePage.dart';
import 'package:toty/pages/LoginPage.dart';
import 'package:toty/style/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AuthService>(
      create: (_) => AuthService(),
      child: ChangeNotifierProvider<ThemeNotifier>(
        child: Toty(),
        create: (_) => ThemeNotifier(),
      ),
    ),
  );
}

class Toty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Disables landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeNotifier>(context).currentThemeData,
      initialRoute: homeRoute,
      routes: {
        homeRoute: (context) => HomePage(),
        accountRoute: (context) => AccountPage(),
        loginRoute: (context) => LoginPage(),
      },
    );
  }
}
