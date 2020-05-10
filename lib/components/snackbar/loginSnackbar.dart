import 'package:flutter/material.dart';
import 'package:toty/config/routes.dart';
import 'package:toty/pages/LoginPage.dart';

class LoginSnackbar extends SnackBar {
  final BuildContext context;
  final String targettedRoute;

  static void _goToLogin(BuildContext context, String route) {
    Navigator.of(context).pushNamed(
      loginRoute,
      arguments: LoginPageArguments(targettedRoute: route),
    );
  }

  LoginSnackbar({Key key, @required this.context, this.targettedRoute})
      : super(
          key: key,
          content: Text('You have to be logged in to access this'),
          action: SnackBarAction(
            label: 'Log in',
            onPressed: () => _goToLogin(context, targettedRoute),
          ),
        );
}
