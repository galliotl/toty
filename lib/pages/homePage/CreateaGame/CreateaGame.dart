import 'package:flutter/material.dart';
import 'package:toty/components/clippers/TruncatedRightSquareClipper.dart';
import 'package:toty/components/layouts/ActionPageClip.dart';
import 'package:toty/components/snackbar/notYetImplementedSnackbar.dart';

class CreateaGamePanel extends StatelessWidget {
  void _ctaCallBack(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(NotYetImplementedSnackbar(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return ActionPageClip(
      caption: 'Create a match and invite your friends or defy your whole town',
      clipper: TruncatedRightSquareClipper(),
      ctaCallback: _ctaCallBack,
      ctaText: 'Create a game',
      pathToImage: 'assets/images/createaGame.svg',
      title: 'Create a game',
    );
  }
}
