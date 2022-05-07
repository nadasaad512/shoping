import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_store/firebase/provider/app_provider.dart';
import '../../helpers.dart';
import '../../router_helper.dart';
import 'logain.dart';

class Forget extends StatefulWidget{
  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget>with Helpers {
  TextEditingController editingController =TextEditingController();
  GlobalKey<FormState> globalkey= GlobalKey<FormState>();
  bool valid=false;
  String Validitorforget(String value) {

    bool cheak = Provider.of<AppProvider>(context, listen: false).forgeterror;

    if (value.isEmpty) {
      return "Enter required data !";
    }
    else
   if (cheak) {
      return "There is no account for this address";
    }
    else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key:globalkey ,
          autovalidateMode:  AutovalidateMode.onUserInteraction,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 100,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    RouterHelper.routerHelper.routingToSpecificWidget(LogainScreen());
                  },

                    child: Icon(Icons.arrow_back_outlined)),
                SizedBox(height: 30,),
                 Text("Reset my Password",style: TextStyle(
                   color: Colors.black,
                  // fontWeight: FontWeight.bold,
                   fontSize: 20,
                   fontFamily: 'SFProBold'
                 ),),

                SizedBox(height: 80,),
                TextFormField(


                  keyboardType:TextInputType.emailAddress,
                  cursorColor: Colors.green,
                  controller:editingController,

                   validator:(value)=>Validitorforget(value)
                     ,

                  decoration: InputDecoration(
                    label: Text("Email".tr(),style: TextStyle(
                        fontSize: 14,
                        fontFamily: "SFProRegular",
                        color: Color(0xff929292)
                    ),),

                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),

                  ),

                ),
                SizedBox(height: 100,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   TextButton(

                       style: TextButton.styleFrom(
                           padding: EdgeInsets.symmetric(
                               horizontal: 40.h,
                               vertical: 16.w
                           ),

                           backgroundColor: Color(0xff00C569)
                       ),
                       onPressed: (){
                         bool cheack= globalkey.currentState.validate();
                         if(cheack==true){
                           Provider.of<AppProvider>(context, listen: false).forgetPassword(editingController.text);
                           setState(() {
                             valid=true;
                           });
                           showSnackBar(context, message: 'See a message on your email', error: false);
                         }

                       }, child:
                   Text("SEND".tr(),style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontFamily: "SFProTextRegular"
                   ),)),
                   TextButton(

                       style: TextButton.styleFrom(
                           padding: EdgeInsets.symmetric(
                               horizontal: 40.h,
                               vertical: 16.w
                           ),

                           backgroundColor: valid?Color(0xff00C569):Colors.grey
                       ),
                       onPressed: (){
                         valid?
                         RouterHelper.routerHelper.routingToSpecificWidget(LogainScreen()):null;
                       }, child:
                   Text("Done".tr(),style: TextStyle(
                       color: Colors.white,
                       fontSize: 14,
                       fontFamily: "SFProTextRegular"
                   ),)),

                 ],
               )

              ],
            ),
          ),
        ),
      ),
    );
  }
}