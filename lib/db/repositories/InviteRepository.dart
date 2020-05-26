import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:toty/db/dbModels/Invite.dart';

class InviteRepository {
  String collectionName = 'invites';
  Firestore _db;
  CollectionReference invites;

  InviteRepository() {
    _db = Firestore.instance;
    invites = _db.collection(this.collectionName);
  }

  /// Adds an invite to the db
  Future<void> createInvite(Invite invite) async {
    return await invites.add(invite.toJson());
  }

  /// Get a single invite from its id
  Future<Invite> getInviteById(String id) async {
    DocumentSnapshot doc = await invites.document(id).get();
    return Invite.fromJson(doc.documentID, doc.data);
  }

  /// Gets a list of pending invite sent to the given user
  Stream<List<Invite>> getInvitesForUser({@required String uid, int limit}) {
    Query query = invites
        .where('targetId', isEqualTo: uid)
        .where(
          'status',
          isEqualTo: Invite.statusToString(
            InviteStatus.pending,
          ),
        )
        .orderBy('createdDate');
    if (limit != null) {
      query = query.limit(limit);
    }
    return query.snapshots().map(
          (snap) => snap.documents
              .map((e) => Invite.fromJson(e.documentID, e.data))
              .toList(),
        );
  }

  Future<void> updateInvite(Invite invite) async {
    return await invites
        .document(invite.inviteId)
        .setData(invite.toJson(), merge: true);
  }
}
