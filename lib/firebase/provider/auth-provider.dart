// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shopping_store/firebase/data/auth_fire.dart';
// import 'package:shopping_store/ui/screens/mainScreen.dart';
// import 'package:shopping_store/ui/welcom/logain.dart';
// import '../../router_helper.dart';
//
//
//
// class AuthProvider extends ChangeNotifier {
//    createUser({String email, String password}) async {
//     try {
//       String x = await AuthHelper.authHelper.createNewAccount(email, password);
//       if (x != null) {
//         RouterHelper.routerHelper.routingToSpecificWidget(LogainScreen());
//        // return true;
//       } else {
//       //  return false;
//         log('error occured');
//       }
//     } on Exception catch (e) {
//       log(e.toString());
//     }
//   }
//
//   login({String email, String password}) async {
//     UserCredential x = await AuthHelper.authHelper.signIn(email, password);
//     if (x != null) {
//     //  RouterHelper.routerHelper.routingToSpecificWidget(MainScreen());
//
//     } else {
//       return "Email or Password not Valid";
//     }
//   }
//
//   logOut() async
//   {
//     await AuthHelper.authHelper.logout();
//     RouterHelper.routerHelper.routingToSpecificWidget(LogainScreen());
//   }
//
//   forgetPassword(String email) async {
//     AuthHelper.authHelper.forgetPassword(email);
//     print("from provider");
//   }
//
//    Future<UserCredential> signInWithGoogle()  async {
//     UserCredential x = await AuthHelper.authHelper.signInWithGoogle();
//     if (x != null) {
//       print ("hi my $x");
//    return x;
//
//     } else {
//      print("invalud");
//     }
//
//   }
//   // Future<UserCredential> signInWithFacebook()  async {
//   //   UserCredential x = await AuthHelper.authHelper.signInWithFacebook();
//   //   if (x != null) {
//   //     RouterHelper.routerHelper.routingToSpecificWidget(MainScreen());
//   //
//   //   } else {
//   //     print("invalud");
//   //   }
//   // }
//
//
// }
