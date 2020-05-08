import 'package:flutter/material.dart';
import 'package:toty/config/routes.dart';
import 'package:toty/pages/LoginPage.dart';

// Todo: theme
class LoginAlert extends StatelessWidget {
  String targettedRoute;

  LoginAlert({this.targettedRoute});

  void _close(context) {
    Navigator.of(context).pop();
  }

  void _goToLogin(context) {
    Navigator.of(context).pushReplacementNamed(
      loginRoute,
      arguments: LoginPageArguments(targettedRoute: targettedRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('You must be signed in to access this'),
      actions: [
        FlatButton(
          child: Text('Close'),
          onPressed: () => _close(context),
        ),
        FlatButton(
          child: Text('Sign in'),
          onPressed: () => _goToLogin(context),
        ),
      ],
    );
  }
}

Future<void> showLoginDialog(
    {@required BuildContext context, String targettedRoute}) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => LoginAlert(
      targettedRoute: targettedRoute,
    ),
  );
}
