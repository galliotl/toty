import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class User {
  String uid;
  String displayName;
  String email;
  Timestamp lastSeen;
  String photoUrl;

  User({
    @required this.uid,
    @required this.displayName,
    @required this.email,
    @required this.lastSeen,
    @required this.photoUrl,
  });

  factory User.fromJson(String id, Map<String, dynamic> json) {
    return User(
      uid: id,
      displayName: json['displayName'],
      email: json['email'],
      lastSeen: json['lastSeen'],
      photoUrl: json['photoUrl'],
    );
  }

  toJson() {
    return {
      'uid': this.uid,
      'email': this.email,
      'photoUrl': this.photoUrl,
      'displayName': this.displayName,
      'lastSeen': this.lastSeen,
    };
  }
}
