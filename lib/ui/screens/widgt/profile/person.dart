import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:shopping_store/firebase/provider/app_provider.dart';
import 'package:shopping_store/firebase/provider/auth-provider.dart';
import 'package:shopping_store/ui/class/data/profile.dart';
import 'package:shopping_store/ui/class/data/profile.dart';
import 'package:shopping_store/ui/class/data/profile.dart';

import 'package:shopping_store/ui/class/modulas/profile.dart';
import 'package:shopping_store/ui/screens/widgt/profile/profilescreen.dart';
import 'package:shopping_store/ui/screens/widgt/profile/provider.dart';


import '../../../../router_helper.dart';
import '../../mainScreen.dart';
import '../favirate.dart';

class PersonalScreen extends StatelessWidget{
  Profile profilew;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
     return  Scaffold(
       body: SingleChildScrollView(
         child: Container(
           margin: EdgeInsets.symmetric(vertical: 50.h,horizontal: 16.w),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               IconButton(
                   onPressed: () {
                     RouterHelper.routerHelper.routingToSpecificWidget(MainScreen());
                   },
                   icon: Icon(
                     Icons.arrow_back_outlined,
                     color: Colors.black,
                   )),
               Row(
                 children: [

                   CircleAvatar(radius: 40,
                   backgroundImage:

                   Provider.of<CameraProvider>(context).file==null?null:
                   FileImage(Provider.of<CameraProvider>(context).file),

                   ),
                   SizedBox(width: 30.w,),
                   Column(
                     children: [
                       Text(provider.nameController.text
                         ,style: TextStyle(
                           fontSize: 26
                       ),),
                       SizedBox(height: 9.h,),
                       Text(provider.emailController.text,style: TextStyle(
                           fontSize: 14,
                           color: Colors.black
                       )),
                     ],
                   )
                 ],
               ),

               SizedBox(height:50.h ,),
               SingleChildScrollView(
                 child: Container(
                   margin: EdgeInsets.only(
                       bottom: 20.h
                   ),
                   child: Column(

                     children: [
                       Row(
                         children: [
                           Container(
                             width: 40.w,
                             height: 40.h,
                             decoration: BoxDecoration(
                                 color: Colors.green.shade100,
                                 borderRadius: BorderRadius.circular(4),
                                 image: DecorationImage(
                                     image: AssetImage("assets/Group 188.png")
                                 )
                             ),
                           ),
                           SizedBox(width: 15.w,),
                           Text("Edit Profile".tr(),style: TextStyle(
                               fontSize: 18,
                               fontFamily: " SFProRegular"
                           ),),
                           Spacer(),
                           IconButton(onPressed: (){
                            // Navigator.pushNamed(context,'/PersonalScreen');
                             RouterHelper.routerHelper.routingToSpecificWidget(ProfileScreen());
                            // Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
                             //RouterHelper.routerHelper.pushToSpecificScreenByName(  'ProfileScreen');
                             //RouterHelper.routerHelper.routingToSpecificWidget(ProfileScreen());
                           }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)),
                         ],
                       ),
                       SizedBox(height:20.h ,),
                       Row(

                         children: [
                           Container(
                             width: 40.w,
                             height: 40.h,
                             decoration: BoxDecoration(
                                 color: Colors.green.shade100,
                                 borderRadius: BorderRadius.circular(4),
                                 image: DecorationImage(
                                     image: AssetImage( "assets/Group 185.png")
                                 )
                             ),
                           ),
                           SizedBox(width: 15.w,),
                           Text("Shipping Address".tr(),style: TextStyle(
                               fontSize: 18,
                               fontFamily: " SFProRegular"
                           ),),
                           Spacer(),
                           IconButton(onPressed: (){

                             // Navigator.pushNamed(context, '/FavariteScreen');
                             //Provider.of<AppProvider>(context, listen: false).logOut();
                           }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)),
                         ],
                       ),
                       SizedBox(height:20.h ,),
                       Row(

                         children: [
                           Container(
                             width: 40.w,
                             height: 40.h,
                             decoration: BoxDecoration(
                                 color: Colors.green.shade100,
                                 borderRadius: BorderRadius.circular(4),
                                 image: DecorationImage(
                                     image: AssetImage("assets/Group 189.png")
                                 )
                             ),
                           ),
                           SizedBox(width: 15.w,),
                           Text("Wishlist".tr(),style: TextStyle(
                               fontSize: 18,
                               fontFamily: " SFProRegular"
                           ),),
                           Spacer(),
                           IconButton(onPressed: (){
                             RouterHelper.routerHelper.routingToSpecificWidget(FavariteScreen());
                           }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)),
                         ],
                       ),
                       SizedBox(height:20.h ,),
                       Row(

                         children: [
                           Container(
                             width: 40.w,
                             height: 40.h,
                             decoration: BoxDecoration(
                                 color: Colors.green.shade100,
                                 borderRadius: BorderRadius.circular(4),
                                 image: DecorationImage(
                                     image: AssetImage("assets/Group 193.png")
                                 )
                             ),
                           ),
                           SizedBox(width: 15.w,),
                           Text("Order History".tr(),style: TextStyle(
                               fontSize: 18,
                               fontFamily: " SFProRegular"
                           ),),
                           Spacer(),
                           IconButton(onPressed: (){

                             // Navigator.pushNamed(context, '/FavariteScreen');
                             //Provider.of<AppProvider>(context, listen: false).logOut();
                           }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)),
                         ],
                       ),
                       SizedBox(height:20.h ,),
                       Row(

                         children: [
                           Container(
                             width: 40.w,
                             height: 40.h,
                             decoration: BoxDecoration(
                                 color: Colors.green.shade100,
                                 borderRadius: BorderRadius.circular(4),

                             ),
                             child: Icon(Icons.language),
                           ),
                           SizedBox(width: 15.w,),
                           Text("language".tr(),style: TextStyle(
                               fontSize: 18,
                               fontFamily: " SFProRegular"
                           ),),
                           Spacer(),
                           IconButton(
                               onPressed: ()
                               {
                             if (context.locale == Locale('en')) {
                               context.setLocale(Locale('ar'));
                             } else {
                               context.setLocale(Locale('en'));
                             }

                           }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)),
                         ],
                       ),
                       SizedBox(height:20.h ,),
                       Row(

                         children: [
                           Container(
                             width: 40.w,
                             height: 40.h,
                             decoration: BoxDecoration(
                                 color: Colors.green.shade100,
                                 borderRadius: BorderRadius.circular(4),
                                 image: DecorationImage(
                                     image: AssetImage("assets/Group 197.png")
                                 )
                             ),
                           ),
                           SizedBox(width: 15.w,),
                           Text("Cards".tr(),style: TextStyle(
                               fontSize: 18,
                               fontFamily: " SFProRegular"
                           ),),
                           Spacer(),
                           IconButton(onPressed: (){

                             // Navigator.pushNamed(context, '/FavariteScreen');
                             //Provider.of<AppProvider>(context, listen: false).logOut();
                           }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)),
                         ],
                       ),
                       SizedBox(height:20.h ,),
                       Row(

                         children: [
                           Container(
                             width: 40.w,
                             height: 40.h,
                             decoration: BoxDecoration(
                                 color: Colors.green.shade100,
                                 borderRadius: BorderRadius.circular(4),
                                 image: DecorationImage(
                                     image: AssetImage( "assets/Group 198.png")
                                 )
                             ),
                           ),
                           SizedBox(width: 15.w,),
                           Text("Notifications".tr(),style: TextStyle(
                               fontSize: 18,
                               fontFamily: " SFProRegular"
                           ),),
                           Spacer(),
                           IconButton(onPressed: (){

                             // Navigator.pushNamed(context, '/FavariteScreen');
                             //Provider.of<AppProvider>(context, listen: false).logOut();
                           }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)),
                         ],
                       ),
                       SizedBox(height:20.h ,),
                       Row(

                         children: [
                           Container(
                             width: 40.w,
                             height: 40.h,
                             decoration: BoxDecoration(
                                 color: Colors.green.shade100,
                                 borderRadius: BorderRadius.circular(4),
                                 image: DecorationImage(
                                     image: AssetImage( "assets/Group 199.png")
                                 )
                             ),
                           ),
                           SizedBox(width: 15.w,),
                           Text("Log Out".tr(),style: TextStyle(
                               fontSize: 18,
                               fontFamily: " SFProRegular"
                           ),),
                           Spacer(),
                           IconButton(onPressed: (){
                            provider.logOut();

                           }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),




             ],
           ),
         ),
       ),

     );
    });

  }

}
class ProfileWid extends StatelessWidget{
  Profile profile;
  ProfileWid({this.profile,Function function});
  @override
  Widget build(BuildContext context) {
    return
       Container(
         margin: EdgeInsets.only(
           bottom: 20.h
         ),
         child: Row(

           children: [
             Container(
               width: 40.w,
               height: 40.h,
               decoration: BoxDecoration(
                   color: Colors.green.shade100,
                   borderRadius: BorderRadius.circular(4),
                   image: DecorationImage(
                       image: AssetImage(profile.image)
                   )
               ),
             ),
             SizedBox(width: 15.w,),
             Text(profile.title,style: TextStyle(
                 fontSize: 18,
                 fontFamily: " SFProRegular"
             ),),
             Spacer(),
             IconButton(onPressed: (){
               Navigator.pushNamed(context, '/FavariteScreen');
               Provider.of<AppProvider>(context, listen: false).logOut();
             }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)),
           ],
         ),
       );




  }

}