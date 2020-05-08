import 'package:flutter/material.dart';
import 'package:toty/config/routes.dart';

// Todo: theme
class LoginAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('You must be signed in to access this'),
      actions: [
        FlatButton(
          child: Text('Sign in'),
          onPressed: () => Navigator.of(context).pushNamed(loginRoute),
        ),
        FlatButton(
          child: Text('Close'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

Future<void> showLoginDialog(context) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => LoginAlert(),
  );
}
