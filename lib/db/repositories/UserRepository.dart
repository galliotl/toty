import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toty/db/dbModels/User.dart';

class UserRepository {
  String collectionName = 'users';
  Firestore _db;
  CollectionReference users;

  UserRepository() {
    _db = Firestore.instance;
    users = _db.collection(this.collectionName);
  }

  /// Get a single user from its id
  Future<User> getUserById(String id) async {
    DocumentSnapshot doc = await users.document(id).get();
    return User.fromJson(doc.documentID, doc.data);
  }

  Stream<List<User>> batchFetch(List<String> idList) {
    return users.where('id', whereIn: idList).snapshots().map((event) => event
        .documents
        .map((e) => User.fromJson(e.documentID, e.data))
        .toList());
  }
}
