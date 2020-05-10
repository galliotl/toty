import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toty/auth/AuthenticationState.dart';

/// Exposes firebase auth api logic in a simpler service class
class AuthService with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Stream<FirebaseUser> _user;

  Stream<Map<String, dynamic>> _profile;
  get profile => _profile;
  set profile(Stream<Map<String, dynamic>> stream) {
    _profile = stream;
    notifyListeners();
  }

  AuthenticationState _state = AuthenticationState.Unchecked;
  get state => _state;
  set state(AuthenticationState newState) {
    _state = newState;
    notifyListeners();
  }

  AuthService() {
    state = AuthenticationState.Unchecked;
    _user = _firebaseAuth.onAuthStateChanged;

    _user.listen((fireUser) {
      if (fireUser != null) {
        profile = _db
            .collection('users')
            .document(fireUser.uid)
            .snapshots()
            .map((snap) => snap.data);
        state = AuthenticationState.Authenticated;
      } else {
        profile = Stream.value({});
        state= AuthenticationState.UnAuthenticated;
      }
    });
  }

  Future<FirebaseUser> googleSigIn() async {
    state = AuthenticationState.Authenticating;
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
      'uid': user.uid,
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
