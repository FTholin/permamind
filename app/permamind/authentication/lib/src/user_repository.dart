import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;


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
    return Firestore.instance.collection('users')
        .where('id',
        isEqualTo: value)
        .getDocuments();
  }

  Future<void> addNewUser(User user) {
    return Firestore.instance.collection('users').add(user.toEntity().toDocument());
  }


  Future<void> deleteAccount(String userId) async {

    final currentUser = await _firebaseAuth.currentUser();

    Firestore.instance.collection('users').where("id",isEqualTo: currentUser.uid).getDocuments().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        doc.reference.delete();
      }
    });

    Firestore.instance.collection('gardens').where("admin",isEqualTo: currentUser.uid).getDocuments().then((snapshot) {
      for (DocumentSnapshot garden in snapshot.documents) {

        // Supprime tous les designs associé au jardin
        Firestore.instance.collection('designs').where("gardenId",isEqualTo: garden.documentID).getDocuments().then((snapshot) {
          for (DocumentSnapshot design in snapshot.documents) {
            design.reference.delete();
          }
        });

        // Supprime tous activités associées au jardin
        Firestore.instance.collection('activities').where("gardenId",isEqualTo: garden.documentID).getDocuments().then((snapshot) {
          for (DocumentSnapshot activity in snapshot.documents) {
            activity.reference.delete();
          }
        });
        // Supprime toutes les parcelles associées au jardin
        Firestore.instance.collection('parcels').where("gardenId",isEqualTo: garden.documentID).getDocuments().then((snapshot) {
          for (DocumentSnapshot parcel in snapshot.documents) {
            parcel.reference.delete();
          }
        });

        // Suppression du jardin
        garden.reference.delete();
      }
    });

    await currentUser.delete();

    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);

  }
}
