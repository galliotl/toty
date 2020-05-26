import 'package:flutter/material.dart';
import 'package:toty/components/clippers/TruncatedLeftSquareClipper.dart';
import 'package:toty/components/snackbar/notYetImplementedSnackbar.dart';
import 'package:toty/components/layouts/ActionPageClip.dart';

class FindaGamePanel extends StatelessWidget {
  void _ctaCallBack(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(NotYetImplementedSnackbar(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return ActionPageClip(
      caption: 'Want a quick game? See what games are organised nearby',
      clipper: TruncatedLeftSquareClipper(),
      ctaCallback: _ctaCallBack,
      ctaText: 'Find a game',
      pathToImage: 'assets/images/findaGame.svg',
      title: 'Find a game',
    );
  }
}
