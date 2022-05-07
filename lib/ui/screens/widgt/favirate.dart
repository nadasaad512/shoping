import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_store/firebase/provider/app_provider.dart';
import 'package:shopping_store/ui/screens/widgt/profile/person.dart';

import '../../../router_helper.dart';

class FavariteScreen extends StatefulWidget {
  @override
  State<FavariteScreen> createState() => _FavariteScreenState();
}

class _FavariteScreenState extends State<FavariteScreen> {
  bool stock=false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(onPressed: (){
            RouterHelper.routerHelper.routingToSpecificWidget(PersonalScreen());
          }, icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
          title: Text("Wishlist".tr(),style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: "SFProRegular"
                 ),)
        ),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            itemCount: provider.allCart.length,
            itemBuilder: (BuildContext context, int index) =>
                Container(
                margin: EdgeInsets.only(top:20, left: 20),
                child: provider.allCart.length == 0
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : provider.allCart.isEmpty
                        ? Center(
                            child: Text(
                              'No Products Found',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 50),
                            ),
                          )
                        : Row(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          provider.allProducts[index].imageUrl),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      provider.allProducts[index].name,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      provider.allProducts[index].price
                                              .toString() +
                                          ' \$',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.green),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 5),
                                            backgroundColor: provider.allProducts[index].iscard==true?Color(0xff00C569):Color(0xffFFB900)),
                                        onPressed: () {

                                          provider.allProducts[index].iscard=false;
                                          print( provider.allProducts[index].iscard);

                                          Future.delayed(Duration(seconds:2)).then((v) {

                                            provider.deleteCart(provider.allCart[index].id);


                                          });

                                        },
                                        child: Text(
                                          provider.allProducts[index].iscard==true?"In Stock".tr():"Out of Stock".tr(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ))),
      );
    });
  }
}

//
// Container(
//           margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 90.h),
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                       onTap: (){
//                         Navigator.pushNamed(context, '/PersonalScreen');
//                       },
//                       child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
//                   SizedBox(width: 120.w,),
//                   Text("Wishlist".tr(),style: TextStyle(
//                       fontSize: 30,
//                       fontFamily: "SFProRegular"
//                   ),)
//                 ],
//               ),
//               SizedBox(height: 40.h,),
//               Row(
//                 children: [
//                   Container(
//                     width: 120,
//                     height: 120,
//
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4),
//                         image: DecorationImage(
//                             image: AssetImage("assets/Image.png")
//                         )
//                     ),
//
//
//                   ),
//
//                   SizedBox(width: 30.w,),
//                   Container(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Smart Backpack",style: TextStyle(
//                             fontSize: 16
//                         ),),
//                         SizedBox(height: 5,),
//                         Text("\$ 4500",style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.green
//                         ),),
//                         SizedBox(height: 25,),
//                         TextButton
//                           (
//                             style: TextButton.styleFrom(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 16,
//                                     vertical: 5
//                                 ),
//
//                                 backgroundColor: Color(0xff00C569)
//                             ),
//                             onPressed: (){}, child: Text("In Stock".tr(),style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14
//                         ),))
//                       ],
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         )
