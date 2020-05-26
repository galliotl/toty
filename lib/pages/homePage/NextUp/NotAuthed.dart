import 'package:flutter/material.dart';
import 'package:toty/components/clippers/SquarishClipper.dart';
import 'package:toty/components/layouts/ActionPageClip.dart';
import 'package:toty/components/snackbar/notYetImplementedSnackbar.dart';

class NotAuthedNextUp extends StatelessWidget {
  void _ctaCallBack(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(NotYetImplementedSnackbar(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return ActionPageClip(
      caption: 'You have to be authed to access this. How about logging in?',
      clipper: SquarishClipper(),
      ctaCallback: _ctaCallBack,
      ctaText: 'Log in',
      pathToImage: 'assets/images/noLocalisation.svg',
      title: 'Next up',
    );
  }
}
