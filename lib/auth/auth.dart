import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toty/auth/AuthenticationState.dart';
import 'package:toty/db/dbModels/User.dart';

/// Exposes firebase auth api logic in a simpler service class
class AuthService with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  BehaviorSubject<User> _profile = BehaviorSubject<User>();
  get profile => _profile;

  BehaviorSubject<AuthenticationState> _state =
      BehaviorSubject<AuthenticationState>();
  get state => _state;

  AuthService() {
    _state.add(AuthenticationState.Unchecked);
    _firebaseAuth.onAuthStateChanged.listen((fireUser) {
      if (fireUser != null) {
        _db.collection('users').document(fireUser.uid).snapshots().listen(
          (snap) {
            User user = User.fromJson(snap.documentID, snap.data);
            _profile.add(user);
          },
        );
        _state.add(AuthenticationState.Authenticated);
      } else {
        _profile.add(null);
        _state.add(AuthenticationState.UnAuthenticated);
      }
    });
  }

  /// Signs in to Google oAuth2 and notifies Firebase
  Future<FirebaseUser> googleSigIn() async {
    _state.add(AuthenticationState.Authenticating);
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    FirebaseUser user =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    updateUserData(user);
    return user;
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    return ref.setData({
      'email': user.email,
      'photoUrl': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);
  }

  void signOut() {
    _firebaseAuth.signOut();
  }
}
