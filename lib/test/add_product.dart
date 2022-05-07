import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:shopping_store/firebase/provider/app_provider.dart';
import 'package:shopping_store/test/widgets/custom_button.dart';
import 'package:shopping_store/test/widgets/custom_testfield.dart';
import 'package:shopping_store/ui/screens/widgt/ExplorScreen/Gadgets/Gadgetsscreen.dart';

import '../router_helper.dart';

class AddNewProduct extends StatelessWidget {
  bool isForEdit;
  String productId;
  AddNewProduct({this.isForEdit = false, this.productId});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,

      body: Consumer<AppProvider>(builder: (context, provider, x) {
        return Container(
            margin: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
                crossAxisAlignment: CrossAxisAlignment.start,


                children: [
                  SizedBox(height: 50.h,),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        RouterHelper.routerHelper.routingToSpecificWidgetWithoutPop(GadgetsScreen());
                      }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
                      SizedBox(width: 60.w,),
                      Text(isForEdit?'Edit Product':'Add Product',style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "SFProRegular"
                      ),),
                    ],
                  ),



                  SizedBox(height: 30.h,),
                  GestureDetector(
                    onTap: () {
                      provider.selectSource(context);
                    },
                    child: provider.file == null
                        ? provider.imageUrl == null
                            ? Center(
                              child: Container(
                        width:164.0,
                        height: 240.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                       borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                            )

                            :  Center(
                              child: Container(
                      width:164.0,
                      height: 240.0,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(provider.imageUrl),
                          fit: BoxFit.cover,

                        )
                      ),
                    ),
                            )
                        : Center(
                          child: Container(
                      width:164.0,
                      height: 240.0,
                      decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: FileImage(provider.file),
                                fit: BoxFit.cover
                            )
                      ),
                    ),
                        ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    controller: provider.nameController,
                    label: 'Name',
                  ),
                  CustomTextfield(
                    controller: provider.descriptionController,
                    label: 'Description',
                  ),
                  CustomTextfield(
                    controller: provider.priceController,
                    textInputType: TextInputType.number,
                    label: 'Price',
                  ),
                  SizedBox(height: 20,),
                  isForEdit
                      ? CustomButton(
                          title: 'Edit Product',
                          function: () {
                           provider.editProduct(this.productId);
                           // provider.cardProduct(this.productId);
                          },
                        )
                      : CustomButton(
                          title: 'Add Product',
                          function: () {
                           provider.addProduct();

                          },
                        )
                ],
              ),
            ));
      }),
    );
  }
}
