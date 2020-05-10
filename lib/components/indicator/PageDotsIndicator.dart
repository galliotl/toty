import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class PageDotsIndicator extends StatelessWidget {
  final int _currentindex;
  final int _itemCount;

  PageDotsIndicator(this._currentindex, this._itemCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: DotsIndicator(
        dotsCount: this._itemCount,
        position: this._currentindex.toDouble(),
        decorator: DotsDecorator(
          color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          activeColor: Theme.of(context).accentColor,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          size: const Size(30.0, 10.0),
          activeSize: const Size(100.0, 10.0),
        ),
      ),
    );
  }
}
