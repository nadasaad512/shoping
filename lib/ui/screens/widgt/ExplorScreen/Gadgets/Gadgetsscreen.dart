import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_store/firebase/provider/app_provider.dart';
import 'package:shopping_store/test/add_product.dart';

import '../../../../../router_helper.dart';
import '../../../mainScreen.dart';
import '../../favirate.dart';
import 'no_filter/nofilterscreen.dart';

class GadgetsScreen extends StatefulWidget {
  @override
  State<GadgetsScreen> createState() => _GadgetsScreenState();
}

class _GadgetsScreenState extends State<GadgetsScreen> {
  bool icon =false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        floatingActionButton: Visibility(
          visible:
          //provider.loggedUser?.isAdmin ??
              true,
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
            onPressed: () {
            RouterHelper.routerHelper.routingToSpecificWidget(AddNewProduct());

            },
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: (){
              RouterHelper.routerHelper.routingToSpecificWidget(MainScreen());
            },
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: IconButton(
                    onPressed: () {
                      RouterHelper.routerHelper.routingToSpecificWidget(MainScreen());
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                    ))),
          ),
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              "Devices",
              style: TextStyle(
                  fontFamily: "SFProRegular",
                  color: Colors.black,
                  fontSize: 30),
            ),
          ),
        ),
        // persistentFooterButtons: [
        //   Container(
        //     height: 50,
        //     margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         TextButton(
        //             onPressed: () {
        //               Navigator.pushNamed(context, '/NoFilterScreen');
        //             },
        //             child: Text(
        //               "No filters applied".tr(),
        //               style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 14,
        //                   fontFamily: "SFProBold"),
        //             )),
        //         SizedBox(
        //           width: 54.w,
        //         ),
        //         TextButton(
        //             style: TextButton.styleFrom(
        //                 padding:
        //                     EdgeInsets.symmetric(horizontal: 45, vertical: 15),
        //                 backgroundColor: Color(0xff00C569)),
        //             onPressed: () {
        //               RouterHelper.routerHelper.routingToSpecificWidgetWithoutPop(FavariteScreen());
        //              // Navigator.pushNamed(context, '/FilterScreen');
        //             },
        //             child: Text(
        //               "FILTER".tr(),
        //               style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 14,
        //                   fontFamily: "SFProRegular"),
        //             )),
        //       ],
        //     ),
        //   )
        // ],
        body: // //api
            GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1 / 2,
                  mainAxisSpacing: 4,
                ),
                itemCount: provider.allProducts.length,
                itemBuilder: (BuildContext context, int index) =>

                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: provider.allProducts == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : provider.allProducts.isEmpty
                              ? Center(
                                  child: Text(
                                    'No Products Found',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 50),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    RouterHelper.routerHelper
                                        .routingToSpecificWidgetWithoutPop(
                                            NoFilterScreen(
                                      image: provider.allProducts[index].imageUrl,
                                      title: provider.allProducts[index].name,
                                        detal:  provider.allProducts[index].description,
                                       price:  provider.allProducts[index].price,
                                       productId:  provider.allProducts[index].id,
                                    ));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 164.0,
                                            height: 240.0,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(provider
                                                    .allProducts[index]
                                                    .imageUrl),
                                                fit: BoxFit.cover,
                                              ),
                                            ),

                                          ),
                                          Visibility(
                                            visible:
                                               provider.loggedUser?.isAdmin ?? false,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                alignment: AlignmentDirectional
                                                    .centerEnd,
                                                height: 50,
                                                color: Colors.white70,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: IconButton(
                                                          icon:
                                                              Icon(Icons.edit),
                                                          color: Colors.green,
                                                          onPressed: () {
                                                            provider.goToEditProduct(
                                                                provider.allProducts[
                                                                    index]);
                                                          },
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      IconButton(
                                                        icon:
                                                            Icon(Icons.delete),
                                                        color:
                                                            Colors.red.shade800,
                                                        onPressed: () {

                                                          // provider.goToCart(
                                                          //     provider.allProducts[index]
                                                          //
                                                          //
                                                          // );
                                                          provider.deleteProduct(
                                                              provider.allProducts[index].id);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: 20
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              provider.allProducts[index].name,
                                              // "BeoPlay Speaker",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Spacer(),
                                            InkWell(
                                              onTap: (){
                                                provider.goToCash(provider.allProducts[index]);
                                                //provider.allProducts[index].iscard=true;
                                              },


                                              child:  Icon(Icons.shopping_cart,color: Colors.green,size: 20,) ,
                                            ),

                                            SizedBox(width: 20,),
                                            InkWell(
                                              onTap: (){
                                                provider.goToCart(provider.allProducts[index]);
                                                provider.allProducts[index].iscard=true;
                                              },
                                              onDoubleTap: (){
                                                provider.deleteCart(provider.allCart[index].id);
                                                provider.allProducts[index].iscard=false;
                                              },

                                              child:Icon( provider.allProducts[index].iscard==true?Icons.star:Icons.star_outline,color: Colors.green,size: 20,) ,
                                            ),


                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        provider.allProducts[index].description,
                                        //"Bang and Olufsen",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff929292)),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        provider.allProducts[index].price
                                                .toString() +
                                            ' \$',
                                        //"\$755",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff00C569)),
                                      ),
                                    ],
                                  ),
                                ),
                    )),
      );
    });
  }
}
