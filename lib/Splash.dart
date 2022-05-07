import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shopping_store/router_helper.dart';
import 'package:shopping_store/ui/welcom/logain.dart';
import 'package:shopping_store/ui/welcom/sign.dart';

import 'firebase/provider/app_provider.dart';



class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds:5)).then((v) {
      User user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        RouterHelper.routerHelper.routingToSpecificWidget(SignUpScreen());
      } else {
        Provider.of<AppProvider>(context, listen: false).getUserFromFirebase();
        RouterHelper.routerHelper.routingToSpecificWidget(LogainScreen());
      }
    });
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.centerEnd,
            colors: [
              Colors.white,
              Colors.white12,
            ],
          ),
        ),
        child: Center(
          child: Column(
           children: [
             SizedBox(height: 150.h,),
             LottieBuilder(
               lottie: AssetLottie("assets/cart.json"),
             ),
             SizedBox(height: 10.h,),
             Text("Green Store",style: TextStyle(
               fontSize: 30,
               fontFamily: "SFProRegular",
               fontWeight: FontWeight.bold,
               color: Colors.green
             ),)

           ], 
          ),
        )
      ),
    );
  }
}
