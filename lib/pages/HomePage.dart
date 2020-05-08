import 'package:flutter/material.dart';
import 'package:toty/auth/AuthenticationState.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/components/alerts/LoginAlert.dart';

class HomePage extends StatelessWidget {
  void _goToAccount(context) {
    Navigator.of(context).pushNamed('/account');
  }

  void _showLoginPopUp(context) {
    showLoginDialog(context).then((value) => null);
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
        });
  }
}
