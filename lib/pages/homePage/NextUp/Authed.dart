import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toty/components/cards/InvitationCard.dart';
import 'package:toty/components/cards/MatchCard.dart';
import 'package:toty/components/clippers/SquarishClipper.dart';
import 'package:toty/components/layouts/ActionPageClip.dart';
import 'package:toty/components/snackbar/notYetImplementedSnackbar.dart';
import 'package:toty/viewModels/NextUpViewModel.dart';
import 'package:toty/viewModels/uiModels/InviteUIModel.dart';
import 'package:toty/viewModels/uiModels/MatchUIModel.dart';

class AuthedNextUp extends StatelessWidget {
  _goToCreateGame(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      NotYetImplementedSnackbar(context: context),
    );
  }

  Widget _buildNothingToShow() {
    return ActionPageClip(
      caption: 'No much here...',
      clipper: SquarishClipper(),
      ctaCallback: _goToCreateGame,
      ctaText: 'Create a game',
      pathToImage: 'assets/images/noMatch.svg',
      title: 'Next up',
    );
  }

  Widget _buildShowContent(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(itemBuilder: (context, i) {
      return FutureBuilder(
        future: snapshot.data[i],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data is MatchUIModel) {
              return MatchCard.fromUIModel(snapshot.data);
            } else if (snapshot.data is InviteUIModel) {
              return InvitationCard.fromUIModel(snapshot.data);
            } else {
              throw Exception('Type not known');
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<NextUpViewModel>(context).cards,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.length > 0) {
          return _buildShowContent(context, snapshot);
        } else {
          return _buildNothingToShow();
        }
      },
    );
  }
}
