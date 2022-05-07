import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_store/firebase/provider/app_provider.dart';
import 'package:shopping_store/firebase/provider/auth-provider.dart';
import 'package:shopping_store/ui/screens/widgt/ExplorScreen/explorscreen.dart';
import 'package:shopping_store/ui/welcom/sign.dart';
import '../../router_helper.dart';
import 'customfield.dart';





class LogainScreen extends StatefulWidget {

  @override
  State<LogainScreen> createState() => _LogainScreenState();
}

class _LogainScreenState extends State<LogainScreen> {
  GlobalKey<FormState> globalkey= GlobalKey<FormState>();

  String ValiditorPassword(String value) {

    bool cheak1 = Provider.of<AppProvider>(context, listen: false).emailpasserror;

    if (value.isEmpty) {
      return "Enter required data !";
    }
    else if (cheak1) {
      print(" this. $cheak1");
        return "Email or Password Invalid";
      }
    else{
      return null;
    }
  }
  String ValiditorEmail(String value){
    if(value.isEmpty){
      return 'Enter required data !';
    }
    return null;
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: SingleChildScrollView(
        child: Form(
          key: globalkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            margin: EdgeInsets.only(top: 124.h, bottom: 48.h, left: 15.w, right: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 100,
                  shape:
                  BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  shadowColor: Colors.white,
                  child: Container(
                    margin: EdgeInsets.only(top: 14, left: 16, right: 16, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                             "Welcom".tr(),
                              style: TextStyle(
                                  fontSize: 30,
                                fontFamily: "SFProBold",
                              ),
                            ),
                            InkWell(
                              onTap: (){
                               RouterHelper.routerHelper.routingToSpecificWidget(SignUpScreen());
                              },
                              child: Text(
                                "sign".tr(),
                                style:
                                TextStyle(fontSize: 18, color: Color(0xff00C569),fontFamily: "SFProRegular",),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "continue".tr(),
                          style: TextStyle(fontSize: 14, color: Color(0xff929292),fontFamily: "SFProRegular",),
                        ),
                        CustomField(
                          type: TextInputType.emailAddress,
                          label: "Email".tr(),
                          Counter: "",
                          point: false,
                          controller: emailController,
                          validitorfun: ValiditorEmail,
                        ),
                        CustomField(
                          type: TextInputType.text,
                          label: "Password".tr(),
                          Counter: "Forgot Password?".tr(),
                          forgetemail: emailController.text,
                          point: true,
                          controller: passwordController,
                          validitorfun: ValiditorPassword,
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            bool cheack= globalkey.currentState.validate();
                            if(cheack){
                              Provider.of<AppProvider>(context, listen: false).login(emailController.text, passwordController.text);

                            }




                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(top: 15, bottom: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              primary: Color(0xff00C569)),
                          child: Center(child: Text("SIGN IN".tr(),style: TextStyle(
                            fontFamily: 'SFProTextRegular'
                          ),)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "-OR-".tr(),
                  style: TextStyle(fontSize: 18,fontFamily: "SFProRegular",),
                ),
                SizedBox(
                  height: 43,
                ),

                button(image:"assets/Path 76.png" ,name:"Sign In with Facebook"),


                SizedBox(
                  height: 20,
                ),
                Container(
                  margin:  EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                   //   await Provider.of<AppProvider>(context, listen: false).signInWithGoogle();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: BorderSide(color: Color(0xffDDDDDD))

                        ),
                        primary: Colors.white
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15) ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/icons8_Google_2.png"),
                          SizedBox(width: 64,),
                          Text("Sign In with Google" .tr(),style:
                          TextStyle(
                              fontSize: 14,
                              color: Color(0xff000000)
                              ,fontFamily: "SFProMedium"
                          ),)
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  button({String image ,String name,Function fun}){
    return   Container(
      margin:  EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 0,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: Color(0xffDDDDDD))

            ),
            primary: Colors.white
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15) ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(image),
              SizedBox(width: 64,),
              InkWell(
                onTap: (){
                  // print("buuttton");
              // Provider.of<AuthProvider>(context, listen: false).signInWithGoogle();
                  //  RouterHelper.routerHelper.routingToSpecificWidget(MainScreen());
                },
                child: Text(name.tr(),style:
                TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000)
                    ,fontFamily: "SFProMedium"
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
