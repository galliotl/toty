import 'package:flutter/foundation.dart';

enum AttendanceTeam {
  team1,
  team2,
  unassigned,
}

class Attendance {
  String attendanceId;
  String userId;
  AttendanceTeam team;
  String matchId;

  Attendance({
    this.attendanceId,
    @required this.userId,
    @required this.team,
    @required this.matchId,
  });

  factory Attendance.fromJson(String id, Map<String, dynamic> json) {
    return Attendance(
      attendanceId: id,
      userId: json['userId'],
      matchId: json['matchId'],
      team: intToAttendanceTeam(int.parse(json['team'])),
    );
  }

  static int attendanceTeamToInt(AttendanceTeam at) {
    switch (at) {
      case AttendanceTeam.team1: return 1;
      case AttendanceTeam.team2: return 2;
      case AttendanceTeam.unassigned: return 0;
      default: return 0;
    }
  }

  static AttendanceTeam intToAttendanceTeam(int i) {
    switch(i) {
      case 0: return AttendanceTeam.unassigned;
      case 1: return AttendanceTeam.team1;
      case 2: return AttendanceTeam.team2;
      default: return AttendanceTeam.unassigned;
    }
  }

  toJson() {
    return {
      'userId': this.userId,
      'matchId': this.matchId,
      'teamNumber': attendanceTeamToInt(this.team),
    };
  }
}
