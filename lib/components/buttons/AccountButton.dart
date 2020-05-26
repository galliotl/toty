import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toty/auth/AuthenticationState.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/config/routes.dart';
import 'package:toty/pages/LoginPage.dart';

class AccountButton extends StatelessWidget {
  void _goToAccount(context) {
    Navigator.of(context).pushNamed(accountRoute);
  }

  void _goToLogin(context) {
    Navigator.of(context).pushNamed(
      loginRoute,
      arguments: LoginPageArguments(targettedRoute: homeRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<AuthService>(context).state,
      builder: (context, snap) {
        AuthenticationState state = snap.data;
        switch (state) {
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
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () => _goToLogin(context),
              );
            }
        }
      },
    );
  }
}
