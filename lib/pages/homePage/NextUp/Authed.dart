import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toty/auth/auth.dart';
import 'package:toty/components/layouts/ActionPage.dart';
import 'package:toty/components/snackbar/notYetImplementedSnackbar.dart';

class AuthedNextUp extends StatelessWidget {
  _goToCreateGame(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(NotYetImplementedSnackbar(context: context));
  }

  Widget _buildNothingToShow() {
    return ActionPage(
      title: 'Next up',
      caption: 'No much here...',
      ctaCallback: _goToCreateGame,
      ctaText: 'Create a game',
      pathToImage: 'assets/images/noMatch.svg',
    );
  }

  Widget _buildShowGames(Map<String, dynamic> profile) {
    return Center(child: Text(profile.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<AuthService>(context, listen: false).profile,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data) {
            return _buildShowGames(snapshot.data);
          } else 
            return _buildNothingToShow();
        });
  }
}
