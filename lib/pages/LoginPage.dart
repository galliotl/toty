import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/config/routes.dart';

class LoginPage extends StatelessWidget {
  void signin(context) {
    LoginPageArguments pageArguments = ModalRoute.of(context).settings.arguments;
    String targettedRoute = pageArguments.targettedRoute != null ? pageArguments.targettedRoute : homeRoute;

    // Signs in the used
    Provider.of<AuthService>(context, listen: false).googleSigIn().then((_) {
      Navigator.of(context).pushReplacementNamed(targettedRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () => signin(context),
          child: Text('Signin'),
        ),
      ),
    );
  }
}

class LoginPageArguments {
  /// Allows to specify a route that was initially
  /// expected to be joined but got to sign in first
  String targettedRoute;
  LoginPageArguments({this.targettedRoute});
}
