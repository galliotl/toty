import 'package:flutter/material.dart';
import 'package:toty/auth/AuthenticationState.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/config/routes.dart';
import 'package:toty/pages/LoginPage.dart';

class AccountButton extends StatelessWidget {
  void _goToAccount(context) {
    Navigator.of(context).pushNamed(accountRoute);
  }

  void _goToLogin(context) {
    Navigator.of(context).pushReplacementNamed(
      loginRoute,
      arguments: LoginPageArguments(targettedRoute: accountRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authService.state,
      builder: (context, snapshot) {
        switch (snapshot.data) {
          case AuthenticationState.Authenticating:
            {
              return CircularProgressIndicator();
            }
          case AuthenticationState.Authenticated:
            {
              return IconButton(
                icon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                onPressed: () => _goToAccount(context),
              );
            }
          default:
            {
              return FlatButton(
                child: Text('Login'),
                onPressed: () => _goToLogin(context),
              );
            }
        }
      },
    );
  }
}
