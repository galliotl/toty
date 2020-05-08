import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toty/auth/AuthenticationState.dart';

/// Exposes firebase auth api logic in a simpler service class
class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Stream<FirebaseUser> user;
  Stream<Map<String, dynamic>> profile;

  PublishSubject<AuthenticationState> state = PublishSubject();

  AuthService() {
    user = _firebaseAuth.onAuthStateChanged;

    user.listen((fireUser) {
      if (fireUser != null) {
        profile = _db
            .collection('users')
            .document(fireUser.uid)
            .snapshots()
            .map((snap) => snap.data);
        state.add(AuthenticationState.Authenticated);
      } else {
        profile = Stream.value({});
        state.add(AuthenticationState.UnAuthenticated);
      }
    });
  }

  Future<FirebaseUser> googleSigIn() async {
    state.add(AuthenticationState.Authenticating);
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    FirebaseUser user =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    updateUserData(user);
    state.add(AuthenticationState.Authenticated);
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
    _firebaseAuth
        .signOut()
        .then((_) => state.add(AuthenticationState.UnAuthenticated));
  }
}

// Creates an exposed auth service variable
final AuthService authService = AuthService();
