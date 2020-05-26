import 'package:flutter/foundation.dart';
import 'package:toty/db/dbModels/Attendance.dart';
import 'package:toty/db/dbModels/Match.dart';
import 'package:toty/viewModels/uiModels/UIDateTime.dart';
import 'package:toty/viewModels/uiModels/UIModel.dart';

/// UI model class to be served to the FE
class MatchUIModel implements IUIModel {
  String matchId;
  UIDateTime matchDateTime;
  double distance;
  int maxPlayers;
  int attendees;

  MatchUIModel({
    @required this.matchId,
    @required this.matchDateTime,
    @required this.attendees,
    @required this.distance,
    @required this.maxPlayers,
  });

  factory MatchUIModel.fromMatchAttendees(Match match, List<Attendance> attendees) {
    return MatchUIModel(
      matchId: match.matchId,
      matchDateTime: UIDateTime(match.dateTime),
      distance: 1.2, // TODO: change
      maxPlayers: match.teamSize * 2,
      attendees: attendees.length,
    );
  }
}
