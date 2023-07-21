import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_page.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try{
      final googleUser = await googleSignIn.signIn();
      if(googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(e){
      print(e.toString());
    }
    notifyListeners();
  }
  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
     // showSnackBar(context, e.message!);
      print(e);
    }
    notifyListeners();
  }

 // Future logout() async {
   // googleSignIn.disconnect();
   // await FirebaseAuth.instance.signOut();
   // return LoginPage();
  //}
}
