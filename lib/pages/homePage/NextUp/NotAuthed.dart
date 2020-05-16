import 'package:flutter/material.dart';
import 'package:toty/components/layouts/ActionPage.dart';
import 'package:toty/components/snackbar/notYetImplementedSnackbar.dart';

class NotAuthedNextUp extends StatelessWidget {
  void _ctaCallBack(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(NotYetImplementedSnackbar(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return ActionPage(
      title: 'Next up',
      ctaCallback: _ctaCallBack,
      ctaText: 'Log in',
      caption: 'You have to be authed to access this. How about logging in?',
      pathToImage: 'assets/images/noLocalisation.svg',
    );
  }
}