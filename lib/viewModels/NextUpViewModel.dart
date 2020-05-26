import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toty/db/dbModels/Attendance.dart';
import 'package:toty/db/dbModels/Invite.dart';
import 'package:toty/db/dbModels/Match.dart';
import 'package:toty/db/dbModels/User.dart';
import 'package:toty/db/repositories/AttendanceRepository.dart';
import 'package:toty/db/repositories/InviteRepository.dart';
import 'package:toty/db/repositories/MatchRepository.dart';
import 'package:toty/db/repositories/UserRepository.dart';
import 'package:toty/services/LocationService.dart';
import 'package:toty/viewModels/uiModels/InviteUIModel.dart';
import 'package:toty/viewModels/uiModels/MatchUIModel.dart';
import 'package:toty/viewModels/uiModels/UIModel.dart';

class NextUpViewModel with ChangeNotifier {
  String uid;
  MatchRepository _matchRepository = MatchRepository();
  InviteRepository _inviteRepository = InviteRepository();
  AttendanceRepository _attendanceRepository = AttendanceRepository();
  UserRepository _userRepository = UserRepository();
  LocationService locationService = LocationService();

  /// A publish subject that combines the 2 streams
  BehaviorSubject<List<Future<IUIModel>>> _cards = BehaviorSubject<List<Future<IUIModel>>>();
  get cards => _cards.asBroadcastStream();

  BehaviorSubject<List<Future<InviteUIModel>>> _invites = BehaviorSubject<List<Future<InviteUIModel>>>();
  BehaviorSubject<List<Future<MatchUIModel>>> _matches = BehaviorSubject<List<Future<MatchUIModel>>>();

  /// Constructor -> Inits the data fetching
  NextUpViewModel({@required this.uid}) {
    this.fetchInviteUIData();
    this.fetchMatchUIData();
  }

  void mergeTwoStreams() async {
    List<Future<InviteUIModel>> invites = await _invites.last;
    List<Future<MatchUIModel>> matches = await _matches.last;

    invites = invites != null ? invites : [];
    matches = matches != null ? matches : [];

    List<Future<IUIModel>> newCards = List<Future<IUIModel>>.from(invites);
    newCards.addAll(matches);
    _cards.add(newCards);
  }

  /// Get a list of the next pending invites and transform it to invite
  /// ui data
  void fetchInviteUIData() {
    _inviteRepository.getInvitesForUser(uid: uid).listen((invites) {
      List<Future<InviteUIModel>> iUIMs = invites.map((invite) async {
        User user = await _userRepository.getUserById(invite.senderId);
        Match match = await _matchRepository.getMatchById(invite.matchId);
        return InviteUIModel.fromUserMatch(user, match);
      }).toList();
      this._invites.add(iUIMs);
      this.mergeTwoStreams();
    });
  }

  /// Get a list of the next attendance and transform it to match data
  /// ui data
  void fetchMatchUIData() {
    _attendanceRepository.getAttendancesForUser(uid).listen((docs) {
      if (docs.length > 0) {
        List<String> ids = docs
            .map(
              (attendance) => attendance.matchId,
            )
            .toList();

        _matchRepository.batchFetch(ids).map((matchList) async {
          List<Future<MatchUIModel>> mUIMs = matchList.map((match) async {
            List<Attendance> attendees = await _attendanceRepository
                .getAttendancesForMatch(match.matchId)
                .last;
            return MatchUIModel.fromMatchAttendees(match, attendees);
          }).toList();
          this._matches.add(mUIMs);
          this.mergeTwoStreams();
        }).toList();
      } else {
        this._matches.add(null);
        this.mergeTwoStreams();
      }
    });
  }

  void onInviteRemoveClicked(Invite invite) {
    // update the status and save it
    invite.status = InviteStatus.rejected;
    _inviteRepository.updateInvite(invite);
  }

  void onInviteAcceptClicked(Invite invite) {
    // update the status and save it
    invite.status = InviteStatus.accepted;
    _inviteRepository.updateInvite(invite);

    // create the according attendance
    Attendance attendance = Attendance(
      userId: this.uid,
      matchId: invite.matchId,
      team: AttendanceTeam.unassigned,
    );
    _attendanceRepository.createAttendance(attendance);
    // Since we're using streams, the invite should disapear
    // from the screen and the match card should appear
  }
}
