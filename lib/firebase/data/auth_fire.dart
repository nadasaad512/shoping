import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_store/ui/screens/mainScreen.dart';

import '../../router_helper.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();


  Future<String> createNewAccount(String email, String password) async {
    try {
     String enterdEmail = email;
     String enteredPassword = password;

      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: enterdEmail, password: enteredPassword);
      return userCredential.user.uid;

    } catch (e)
    {

      log(e.toString());
    }
  }

  Future<UserCredential> signIn(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;

  }


  logout() async {
    await firebaseAuth.signOut();
  }

  forgetPassword(String email) async {
    firebaseAuth.sendPasswordResetEmail(email: email);
  }

  verifyEmail() async {
    firebaseAuth.currentUser.sendEmailVerification();
  }

  registerUsingPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+972592189159',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {
        log(verificationId);
        log(resendToken.toString());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }


  // Future<UserCredential> signInWithGoogle() async {
  //
  //   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  //
  //   final GoogleSignInAuthentication googleAuth = await googleUser?.authentication;
  //
  //   final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken,);
  //
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
}
