import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toty/auth/AuthenticationState.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/components/alerts/LoginAlert.dart';
import 'package:toty/config/routes.dart';
import 'package:toty/style/theme.dart';

class HomePage extends StatelessWidget {
  void _goToAccount(context) {
    Navigator.of(context).pushNamed(accountRoute);
  }

  void _showLoginPopUp(context) {
    showLoginDialog(
      context: context,
      targettedRoute: accountRoute,
    ).then((value) => null);
  }

  void _switchTheme(context) {
    Provider.of<ThemeNotifier>(context, listen: false).switchDarkLight();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authService.state,
      builder: (cxt, snapshot) {
        AuthenticationState state = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: Text('Title'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Main page',
                ),
                MaterialButton(
                  onPressed: () => _switchTheme(context),
                  child: Text('Switch theme'),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: state == AuthenticationState.Authenticated
                ? () => _goToAccount(cxt)
                : () => _showLoginPopUp(cxt),
            tooltip: 'SignIn',
            child: Icon(Icons.account_circle),
          ),
        );
      },
    );
  }
}
