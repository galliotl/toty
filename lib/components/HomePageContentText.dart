import 'package:flutter/material.dart';

class HomePageContentText extends StatelessWidget {
  final String title;
  final String caption;

  HomePageContentText({@required this.title, @required this.caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: 243,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              this.title,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Text(
            this.caption,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
