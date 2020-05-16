import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toty/auth/AuthenticationState.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/pages/homePage/NextUp/NotAuthed.dart';
import 'package:toty/pages/homePage/NextUp/Authed.dart';

class NextUpPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationState state = Provider.of<AuthService>(context).state;
    if (state == AuthenticationState.Authenticated) {
      return AuthedNextUp();
    } else
      return NotAuthedNextUp();
  }
}
