import 'package:flutter/foundation.dart';
import 'package:toty/db/dbModels/User.dart';
import 'package:toty/db/dbModels/Match.dart';
import 'package:toty/viewModels/uiModels/UIDateTime.dart';
import 'package:toty/viewModels/uiModels/UIModel.dart';

/// UI model class to be served to the FE
class InviteUIModel implements IUIModel {
  String playerName;
  String playerAvatarUrl;
  UIDateTime matchDateTime;
  String matchId;

  InviteUIModel({
    @required this.matchId,
    @required this.playerName,
    @required this.playerAvatarUrl,
    @required this.matchDateTime,
  });

  factory InviteUIModel.fromUserMatch(User user, Match match) {
    return InviteUIModel(
      matchId: match.matchId,
      playerName: user.displayName,
      playerAvatarUrl: user.photoUrl,
      matchDateTime: UIDateTime(match.dateTime),
    );
  }
}
