import 'package:flutter/material.dart';

class CallToAction extends StatelessWidget {
  final String text;
  final Function(BuildContext) callback;

  CallToAction({@required this.text, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        this.text,
        style: Theme.of(context).textTheme.button,
      ),
      onPressed: () => this.callback(context),
    );
  }
}
