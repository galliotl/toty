import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/pages/homePage/NextUp/NotAuthed.dart';
import 'package:toty/pages/homePage/NextUp/Authed.dart';
import 'package:toty/viewModels/NextUpViewModel.dart';

class NextUpPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<AuthService>(context).profile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ChangeNotifierProvider<NextUpViewModel>(
              create: (_) => NextUpViewModel(uid: snapshot.data.uid),
              child: AuthedNextUp(),
            );
          } else {
            return NotAuthedNextUp();
          }
        });
  }
}
