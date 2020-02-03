import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  final usersCollection = Firestore.instance.collection('users');


  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser();
  }

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({String pseudo, String email, String password}) async {

    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User newUser = User(result.user.uid, pseudo, email, pseudo.substring(0, 1).toUpperCase());
    await addNewUser(newUser);
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<User> getUserFromId() async {

    final userData = (await searchById((await _firebaseAuth.currentUser()).uid)).documents.first.data;

    return User(userData['id'],userData['pseudo'], userData['email'], userData['searchKey']);
  }

  Future<QuerySnapshot> searchById(String value) {
    return usersCollection
        .where('id',
        isEqualTo: value)
        .getDocuments();
  }

  Future<void> addNewUser(User user) {
    return usersCollection.add(user.toEntity().toDocument());
  }
}
