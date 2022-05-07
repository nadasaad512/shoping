import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class WriteReviwScreen extends StatefulWidget{
  @override
  State<WriteReviwScreen> createState() => _WriteReviwScreenState();
}

class _WriteReviwScreenState extends State<WriteReviwScreen> {
  @override
  Widget build(BuildContext context) {
    double rate=0;
  return Scaffold(

    body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 80.h,horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down,size: 30,)),
                  SizedBox(width:77 ,),
                  Text("Write Review".tr(),style: TextStyle(
                    fontSize: 20
                  ),)
                ],
              ),
            ),
            SizedBox(height: 56.h,),
            Text("Nike Dri-FIT Long Sleeve",style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 50,),
            SmoothStarRating
              (
              rating: rate,
              size:60,
              spacing: 30,
              starCount: 4,
              defaultIconData: Icons.star_border_sharp,
              color: Color(0xffEBE300),
              borderColor: Color(0xffEBEBEB),
              onRated:(value) {
                setState(() {
                  value=rate;
                });
              },


            ),
            SizedBox(height: 72,),
            TextField(
              cursorColor: Colors.black,

              decoration: InputDecoration(
                hintText: 'Tell us  your experience'.tr(),
                hintStyle: TextStyle(
                  color: Colors.grey
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),








              ),
            ),
            SizedBox(height: 66,),
            Container(
              margin: EdgeInsets.only(
                right: 30
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(

                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 45,
                              vertical: 15
                          ),

                          backgroundColor: Color(0xff00C569)
                      ),
                      onPressed: (){

                      }, child:
                  Text("SEND",style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  ),)),
                ],
              ),
            )

          ],
        ),
      ),
    ),
  );
  }
}