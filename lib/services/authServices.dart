import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medic_pulse_doc/UI/logIn/docData.dart';
import 'package:medic_pulse_doc/modals/docModal.dart';

User loggedInUser;

class AuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  bool isSignedIn = false;

  Future<dynamic> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    final User user = userCredential.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = await _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');
    isSignedIn = true;

    loggedInUser = user;
    getDocData();
    return user;
    // if(_alreadyExists){
    //   return  HomePage(),
    // }
    // else{
    // return DocData(),
    // }
  }

  void signOut() async {
    await googleSignIn.signOut();
    isSignedIn = false;
    print("User Sign Out");
  }

  Future<DocModal> getDocData() async {
    DocumentSnapshot field =
        await _db.collection('docInfo').doc(loggedInUser.uid).get();
    var data = field.data();

    return DocModal(
      name: data['name'],
      phno: data['phno'],
      profilepic: data['profilepic'],
      dob: data['dob'],
      sex: data['sex'],
      category: data['category'],
      clinicAddress: data['clinicAddress'],
      dis: data['dis'],
    );
  }
}
