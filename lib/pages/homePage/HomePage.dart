import 'package:flutter/material.dart';
import 'package:toty/components/buttons/accountButton.dart';
import 'package:toty/components/indicator/PageDotsIndicator.dart';
import 'package:toty/pages/homePage/CreateaGame.dart';
import 'package:toty/pages/homePage/FindaGame.dart';
import 'package:toty/pages/homePage/MyTeam.dart';
import 'package:toty/pages/homePage/NextUp/NextUp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(
    initialPage: 1,
  );

  int _currentindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (index) => {
                this.setState(() {
                  this._currentindex = index;
                })
              },
              controller: _pageController,
              children: [
                NextUpPanel(),
                FindaGamePanel(),
                CreateaGamePanel(),
                MyTeamPanel(),
              ],
            ),
          ),
          PageDotsIndicator(_currentindex, 4),
          AccountButton(),
        ],
      ),
    );
  }
}
