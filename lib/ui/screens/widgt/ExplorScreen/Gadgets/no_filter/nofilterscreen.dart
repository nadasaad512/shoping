import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_store/firebase/modules/product_model.dart';
import 'package:shopping_store/firebase/provider/app_provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../../../../router_helper.dart';
import '../../../cart.dart';
import '../Gadgetsscreen.dart';

class NoFilterScreen extends StatelessWidget{
  String image;
  String title;
  String productId;
  num price;
  String detal;

  NoFilterScreen({this.image,this.title, this.productId,this.price,this.detal});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Consumer<AppProvider>(builder: (context, provider, x){
           return Scaffold(

               // persistentFooterButtons: [
               //
               //   Container(
               //     height: 50.h,
               //     margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
               //
               //     child: Row(
               //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
               //       children: [
               //         Column(
               //           crossAxisAlignment: CrossAxisAlignment.start,
               //
               //           children: [
               //
               //             Text(" PRICE".tr(),style: TextStyle(
               //                 color: Colors.grey,
               //                 fontSize: 12,
               //                 fontFamily: "SFProRegular"
               //             ),),
               //             SizedBox(height: 5,),
               //             Text(price .toString() +
               //                 ' \$',style: TextStyle(
               //                 color: Color(0xff00C569),
               //                 fontSize: 18,
               //                 fontWeight: FontWeight.bold,
               //                 fontFamily: "SFProBold"
               //             ),),
               //
               //             // SizedBox(height: 22,),
               //           ],
               //         ),
               //         // SizedBox(width: 54,),
               //         TextButton(
               //
               //             style: TextButton.styleFrom(
               //                 padding: EdgeInsets.symmetric(
               //                     horizontal: 60,
               //                     vertical: 16
               //                 ),
               //
               //                 backgroundColor: Color(0xff00C569)
               //             ),
               //             onPressed: (){
               //               RouterHelper.routerHelper
               //                   .routingToSpecificWidgetWithoutPop(
               //                   CartScreen(
               //                     image: image,
               //                     name: title,
               //                     price:price,
               //                     productId: productId,
               //                   ));
               //
               //               provider.goToCash(provider.allCash[0]);
               //
               //             }, child:
               //         Text("ADD".tr(),style: TextStyle(
               //             color: Colors.white,
               //             fontSize: 14,
               //             fontFamily: "SFProRegular"
               //         ),)),
               //       ],
               //     ),
               //   )
               // ],
               body:SingleChildScrollView(
                 child: Column(
                   children: [
                     Stack(
                         children: [
                           Container(
                             child: Image.network(
                               image,
                               fit: BoxFit.cover,
                               width: double.infinity,
                               height: size.height/2,

                             ),


                           ),

                           Container(
                             margin: EdgeInsets.symmetric(vertical: 50.h,horizontal: 16.w),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 IconButton(onPressed: (){
                                   RouterHelper.routerHelper
                                       .routingToSpecificWidgetWithoutPop(GadgetsScreen());
                                 }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,)),
                                 // CircleAvatar(
                                 //     radius: 22,
                                 //     backgroundColor: Colors.white,
                                 //     child: IconButton(onPressed: (){
                                 //
                                 //      // provider.cardProduct(this.productId);
                                 //
                                 //     }, icon: Icon(Icons.star_border,color: Colors.black,) ,
                                 //     )
                                 //   // SvgPicture.asset("assets/WishList.svg",color: Colors.pink,)
                                 //
                                 // ),
                                 //SvgPicture.asset("assets/WishList.svg",color: Colors.pink,)
                               ],
                             ),
                           ),
                         ]),
                     Column(
                       children: [
                         Container(
                             margin: EdgeInsets.symmetric(horizontal: 16.w),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(height: 17.h,),
                                 Text(title,style: TextStyle(
                                     fontSize: 26,
                                     fontWeight: FontWeight.bold,
                                     fontFamily: "SFProBold"
                                 ),),
                                 SizedBox(height: 29.h,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Container(
                                       width: 160.w,
                                       height: 40.h,
                                       padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(25),
                                         border: Border.all(
                                           color: Color(0xffEBEBEB) ,
                                           width: 2.0 ,
                                         ),

                                       ),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Text("Size",style: TextStyle(
                                               fontSize: 14,
                                               fontFamily: "SFProRegular"
                                           ),),
                                           Text("XL",style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                               fontSize: 14,
                                               fontFamily: "SFProBold"
                                           ),),

                                         ],
                                       ),
                                     ),
                                     Container(
                                       width: 160.h,
                                       height: 40.w,
                                       padding: EdgeInsets.only(
                                           left: 5.w
                                       ),
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(25),
                                         border: Border.all(
                                           color: Color(0xffEBEBEB) ,
                                           // width: 2.0 ,
                                         ),

                                       ),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Text("Color".tr(),style: TextStyle(
                                               fontSize: 14,
                                               fontFamily: "SFProRegular"
                                           ),),
                                           Container(
                                             width: 35,height: 35,
                                             margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                             decoration: BoxDecoration(

                                                 color: Colors.pink,
                                                 borderRadius: BorderRadius.circular(8)
                                             ),
                                           )

                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                                 SizedBox(height: 38.h,),
                                 Text("Details".tr(),style: TextStyle(
                                     fontSize: 18,
                                     fontWeight: FontWeight.bold,
                                     fontFamily: "SFProBold"

                                 ),),
                                 SizedBox(height: 19,),
                                 Text(detal,style: TextStyle(
                                   fontSize: 14,

                                 ),),
                                 SizedBox(height: 10,),
                                 Text("Read More",style: TextStyle(
                                     color: Color(0xff00C569),
                                     fontSize: 14
                                 ),),
                                 SizedBox(height: 35.h,),
                                 Text("Reviews".tr(),style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 18,
                                     fontFamily: "SFProBold"
                                 ),),
                                 SizedBox(height: 9.h,),
                                 InkWell(

                                   onTap: (){
                                     Navigator.pushNamed(context,  '/WriteReviwScreen');
                                   },
                                   child: Text("Write your review",style: TextStyle(
                                       color: Color(0xff00C569),
                                       fontSize: 14,
                                       fontFamily: "SFProMedium"
                                   ),),
                                 ),
                                 SizedBox(height: 30.h,),








                               ],
                             )
                         ),
                         Container(
                           margin: EdgeInsets.only(
                               top: 10,
                               left: 5,
                               right: 5
                           ),
                           child: Row(
                             children: [
                             //  CircleAvatar(radius: 20,),
                               SizedBox(width: 20.w,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(height: 25,),
                                   Text("Samuel Smith",style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.bold,
                                       fontFamily: "SFProRegular"
                                   ),),
                                   SizedBox(height: 10,),
                                   Text("Wonderful jean, perfect gift for\n my girl for our anniversary!",
                                       overflow: TextOverflow.ellipsis,

                                       style: TextStyle(
                                           fontSize: 14,
                                           color: Colors.black

                                       )),
                                 ],
                               ),
                               SizedBox(width: 40.w,),
                               Expanded(
                                 child: SmoothStarRating
                                   (
                                   size: 20,
                                   starCount: 4,
                                   borderColor: Color(0xffEBE300),


                                 ),
                               ),


                             ],
                           ),
                         )
                       ],
                     )










                   ],
                 ),
               )
           );
    });




  }

}


/*
   DraggableScrollableSheet(
            builder: (context, ScrollController) {
              return  SingleChildScrollView(
                controller: ScrollController,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 17,),
                            Text("Nike Dri-FIT Long Sleeve",style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 29,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 160,
                                  height: 40,
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Color(0xffEBEBEB) ,
                                      width: 2.0 ,
                                    ),

                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Size",style: TextStyle(
                                          fontSize: 14
                                      ),),
                                      Text("XL",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14
                                      ),),

                                    ],
                                  ),
                                ),
                                Container(
                                  width: 160,
                                  height: 40,
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Color(0xffEBEBEB) ,
                                      width: 2.0 ,
                                    ),

                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Colour",style: TextStyle(
                                          fontSize: 14
                                      ),),
                                      Container(
                                        height: 22,
                                        width: 22,
                                        decoration: BoxDecoration(
                                          color: Color(0xff31407B),
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            topLeft: Radius.circular(8),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 38,),
                            Text("Details",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 19,),
                            Text("Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.Details",style: TextStyle(
                              fontSize: 14,

                            ),),
                            SizedBox(height: 10,),
                            Text("Read More",style: TextStyle(
                                color: Color(0xff00C569),
                                fontSize: 14
                            ),),
                            SizedBox(height: 35,),
                            Text("Reviews",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),),
                            SizedBox(height: 9,),
                            Text("Write your review",style: TextStyle(
                                color: Color(0xff00C569),
                                fontSize: 14
                            ),),
                            SizedBox(height: 30,),








                          ],
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 10,
                          left: 16,
                          right: 5
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(radius: 20,),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 25,),
                              Text("Samuel Smith",style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 10,),
                              Text("Wonderful jean, perfect gift for\n my girl for our anniversary!",
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black

                                  )),
                            ],
                          ),
                          SizedBox(width: 40,),
                          Expanded(
                            child: SmoothStarRating
                              (
                              size: 20,
                              starCount: 4,
                              borderColor: Color(0xffEBE300),


                            ),
                          ),


                        ],
                      ),
                    )
                  ],
                ),
              );
            }
            ),
 */