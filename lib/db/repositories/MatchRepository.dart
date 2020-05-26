import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toty/db/dbModels/Match.dart';

class MatchRepository {
  String collectionName = 'matches';
  Firestore _db;
  CollectionReference matches;

  MatchRepository() {
    _db = Firestore.instance;
    matches = _db.collection(this.collectionName);
  }

  /// Adds a match to the db
  Future<void> createMatch(Match match) async {
    return await matches.add(match.toJson());
  }

  /// Get a single match from its id
  Future<Match> getMatchById(String id) async {
    DocumentSnapshot doc = await matches.document(id).get();
    return Match.fromJson(doc.documentID, doc.data);
  }

  Stream<List<Match>> batchFetch(List<String> idList) {
    return matches.where('id', whereIn: idList).snapshots().map((event) => event
        .documents
        .map((e) => Match.fromJson(e.documentID, e.data))
        .toList());
  }
}
