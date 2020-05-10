import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/components/buttons/CallToAction.dart';
import 'package:toty/style/theme.dart';

class AccountPage extends StatelessWidget {
  void _signOut(BuildContext context) {
    Provider.of<AuthService>(context, listen: false).signOut();
    Navigator.of(context).pop();
  }

  void _switchTheme(BuildContext context) {
    Provider.of<ThemeNotifier>(context, listen: false).switchDarkLight();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<AuthService>(context).profile,
      builder: (context, snapshot) {
        return Scaffold(
          body: snapshot.hasData
              ? Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        snapshot.data.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      MaterialButton(
                        onPressed: () => _signOut(context),
                        child: Text('Signout'),
                      ),
                      CallToAction(
                        callback: _switchTheme,
                        text: 'Switch theme',
                      )
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'You are ot signed in',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      MaterialButton(
                        onPressed: () => _signOut(context),
                        child: Text('Go back'),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
