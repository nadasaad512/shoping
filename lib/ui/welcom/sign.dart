import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_store/firebase/modules/gd_user.dart';
import 'package:shopping_store/firebase/provider/app_provider.dart';
import 'package:shopping_store/ui/welcom/logain.dart';
import '../../router_helper.dart';
import 'customfield.dart';




class SignUpScreen extends StatelessWidget{


  GlobalKey<FormState> globalkey= GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController =TextEditingController();
  //TextEditingController name2Controller =TextEditingController();


  String ValiditorName(String value) {
    if (value.isEmpty) {
      return 'Please Enter Name';
    }
    return null;
  }
  String ValiditorEmail(String value) {
    if (value.isEmpty) {

      return 'Please Enter Email';
    }

    else if (!RegExp(  r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$").hasMatch(value)) {
      return 'Please Enter a valid Email';
    }
    return null;
  }
  String ValiditorPassword(String value) {
    bool hasUppercase = value.contains( RegExp(r'[A-Z]'));
    bool hasDigits = value.contains( RegExp(r'[0-9]'));
    bool hasLowercase = value.contains( RegExp(r'[a-z]'));
    bool hasSpecialCharacters = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = value.length > 6;


    if(value.isEmpty){

      return 'Please Enter Password';
    }
    else if((value.length<6)){
      return "your password very short ";
    }

    else if(!(hasDigits && hasUppercase && hasLowercase && hasSpecialCharacters && hasMinLength)){
      return 'Enter a valid Password';
    }

    else {
      return null;
    }
  }



  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  IconButton(onPressed: (){
          RouterHelper.routerHelper.routingToSpecificWidget(LogainScreen());
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
     body: SingleChildScrollView(
       child: Container(
         margin: EdgeInsets.only(
             top: 10,
             left: 16,
             right: 16,
             bottom: 147
         ),
         child: Form(
           key: globalkey,
           child: Column(

             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               SizedBox(height:32 ,),
               Card(
                 elevation: 50,
                 child: Container(
                   margin: EdgeInsets.only(
                       top: 11,
                       left: 16,
                       right: 16,
                       bottom: 16
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Sign Up".tr(),style: TextStyle(
                           fontFamily: "SFProBold",
                           fontSize: 30
                       ),),
                       SizedBox(height:47.h ,),
                       CustomField(
                         label: "Name".tr(),
                         point: false,
                         Counter: "",
                         type:TextInputType.text ,
                         validitorfun: ValiditorName,
                         controller: nameController,

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
                         Counter: "",
                         point: true,
                         controller: passwordController,
                         validitorfun: ValiditorPassword,
                       ),
                       SizedBox(height:60 ,),
                       ElevatedButton(
                         onPressed: (){
                           Provider.of<AppProvider>(context,listen: false).name(nameController.text);

                           bool cheack= globalkey.currentState.validate();
                           if(cheack){
                             GdUser user = GdUser(email: emailController.text, name: nameController.text, password: passwordController.text,);
                             Provider.of<AppProvider>(context, listen: false).register(user);




                           }
                         },
                         style: ElevatedButton.styleFrom(
                             padding: EdgeInsets.only(top: 15, bottom: 16),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(4),
                             ),
                             primary: Color(0xff00C569)),
                         child: Center(child: Text("SIGN UP".tr(),style: TextStyle(
                           fontFamily:"SFProTextRegular"
                         ),)),
                       )


                     ],
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

}