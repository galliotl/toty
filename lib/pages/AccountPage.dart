import 'package:flutter/material.dart';
import 'package:toty/auth/auth.dart';

class AccountPage extends StatelessWidget {
  void _signOut(context) {
    authService.signOut();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authService.profile,
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
                      )
                    ],
                  ),
                )
              : Text('You are not logged in'),
        );
      },
    );
  }
}
