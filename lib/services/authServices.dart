import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  bool isSignedIn = false;

  Future<dynamic> signInWithGoogle() async{
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,);


    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    final User user = userCredential.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = await _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');
    isSignedIn = true;

    return user;
    // if(_alreadyExists){
    //   return  HomePage(),
    // }
    // else{
    // return DocData(),
    // }

  }

  void updateUserData(User user) async{

  }
  void signOut() async{
    await googleSignIn.signOut();
    isSignedIn = false;
    print("User Sign Out");
  }


}
