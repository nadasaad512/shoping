import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_store/firebase/provider/app_provider.dart';

class CartScreen extends StatefulWidget {
  String image;
  String name;
  num price;
  String productId;
  CartScreen({this.image,this.name,this.price,this.productId});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  Widget build(BuildContext context) {

    return  Consumer<AppProvider>(builder: (context, provider, x) {
      return  Scaffold(
          persistentFooterButtons: [
            // Container(
            //   height: 50.h,
            //   margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            //
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //
            //         children: [
            //
            //           Text(" TOTAL".tr(),style: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 12,
            //               fontFamily: "SFProRegular"
            //           ),),
            //           SizedBox(height: 5,),
            //           Text("\$1500",style: TextStyle(
            //               color: Color(0xff00C569),
            //               fontSize: 18,
            //               fontWeight: FontWeight.bold
            //           ),),
            //
            //           // SizedBox(height: 22,),
            //         ],
            //       ),
            //       // SizedBox(width: 54,),
            //       TextButton(
            //
            //           style: TextButton.styleFrom(
            //               padding: EdgeInsets.symmetric(
            //                   horizontal: 40.h,
            //                   vertical: 16.w
            //               ),
            //
            //               backgroundColor: Color(0xff00C569)
            //           ),
            //           onPressed: (){}, child:
            //       Text("CHECKOUT",style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 14,
            //           fontFamily: "SFProTextRegular"
            //       ),)),
            //     ],
            //   ),
            // )
          ],
          body:  ListView.builder(
            itemCount:  provider.allCash.length,
            // padding: const EdgeInsets.symmetric(vertical: 16),

            itemBuilder: (BuildContext context, int index) {
              return  provider.allCash.length == 0
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : provider.allCash.isEmpty
                  ? Center(
                child: Text(
                  'No Products Found',
                  style:
                  TextStyle(color: Colors.black, fontSize: 50),
                ),
              )
                  :



              Container(
                  margin: EdgeInsets.only(
                    top: 50,
                    right: 20,
                    left: 20,

                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: NetworkImage(
                                  provider.allCash[index].imageUrl),
                              fit: BoxFit.cover,
                            )),

                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            provider.allCash[index].name,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "\$ 95",
                            style: TextStyle(color: Colors.green, fontSize: 16),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          // Container(
                          //   width: 140.w,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(4),
                          //     color: Colors.grey.shade200,
                          //   ),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Container(
                          //         padding: EdgeInsets.only(left: 20),
                          //         child: Icon(
                          //           Icons.add,
                          //           size: 18,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 24,
                          //       ),
                          //       Align(
                          //         alignment: Alignment.center,
                          //         child: Text(
                          //           "1",
                          //           style: TextStyle(fontSize: 14),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 22.w,
                          //       ),
                          //       Container(
                          //         padding: EdgeInsets.only(bottom: 15, right: 12),
                          //         child: Icon(Icons.minimize),
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                      Spacer(),
                      IconButton(onPressed: (){
                        provider.deleteCash(provider.allCash[index].id);

                      }, icon: Icon(Icons.delete,color: Colors.red,))
                    ],
                  ));
            },
          )




      );
    });



  }
}

/*
   Container(
          margin: EdgeInsets.symmetric(vertical: 74),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.asset(
                      "assets/Image.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Tag Heuer Wristwatch",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "\$ 95",
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "1",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 15, right: 12),
                              child: Icon(Icons.minimize),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )),
        )
 */