import 'package:flutter/material.dart';
import 'package:toty/auth/auth.dart';

class LoginPage extends StatelessWidget {
  void signin(context) {
    authService.googleSigIn().then((_) => Navigator.of(context).pop());
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
