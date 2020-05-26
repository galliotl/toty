import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

enum InviteStatus {
  pending,
  rejected,
  accepted,
}

class Invite {
  String inviteId;
  String senderId;
  String targetId;
  String matchId;
  InviteStatus status;

  static InviteStatus stringToStatus(String string) {
    switch (string) {
      case 'pending':
        return InviteStatus.pending;
      case 'rejected':
        return InviteStatus.rejected;
      case 'accepted':
        return InviteStatus.accepted;
      default:
        return null;
    }
  }

  static String statusToString(InviteStatus status) {
    switch (status) {
      case InviteStatus.pending:
        return 'pending';
      case InviteStatus.rejected:
        return 'rejected';
      case InviteStatus.accepted:
        return 'accepted';
      default:
        return '';
    }
  }

  Invite({
    @required this.inviteId,
    @required this.senderId,
    @required this.targetId,
    @required this.matchId,
    @required this.status,
  });

  factory Invite.fromJson(String id, Map<String, dynamic> json) {
    return Invite(
      inviteId: id,
      status: stringToStatus(json['status']),
      senderId: json['senderId'],
      matchId: json['matchId'],
      targetId: json['targetId'],
    );
  }

  toJson() {
    return {
      'senderId': senderId,
      'targetId': targetId,
      'matchId': matchId,
      'status': statusToString(this.status),
      'createdDate': DateTime.now(),
    };
  }
}
