import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final IconData icon;
  final String content;

  InformationCard({
    @required this.icon,
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 20),
        ],
      ),
      child: Container(
        color: Theme.of(context).accentColor,
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(this.icon, color: Theme.of(context).primaryColorDark,),
            Text(this.content),
          ],
        ),
      ),
    );
  }
}
