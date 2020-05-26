import 'package:flutter/foundation.dart';

class Match {
  String matchId;
  DateTime dateTime;
  String address;
  String creator;
  String team1Name;
  String team2Name;
  int teamSize;

  Match({
    @required this.matchId,
    @required this.address,
    @required this.creator,
    @required this.dateTime,
    @required this.team1Name,
    @required this.team2Name,
    @required this.teamSize,
  });

  factory Match.fromJson(String id, Map<String, dynamic> json) {
    return Match(
      matchId: id,
      address: json['address'],
      creator: json['creator'],
      dateTime: json['dateTime'],
      team1Name: json['team1Name'],
      team2Name: json['team2Name'],
      teamSize: json['teamSize'],
    );
  }

  toJson() {
    return {
      'address': this.address,
      'creator': this.creator,
      'dateTime': this.dateTime,
      'team1Name': this.team1Name,
      'team2Name': this.team2Name,
      'teamSize': this.teamSize,
    };
  }
}
