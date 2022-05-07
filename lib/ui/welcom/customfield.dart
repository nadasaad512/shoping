import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_store/firebase/provider/auth-provider.dart';
import 'package:shopping_store/router_helper.dart';

import 'forgetpassword.dart';

class CustomField extends StatelessWidget{
  String label;
  TextInputType type;
  String Counter;
  bool point;
  String forgetemail;
  Function validitorfun;
  TextEditingController controller;
  CustomField({this.label,this.type,this.Counter,this.point,this.controller,this.forgetemail,this.validitorfun});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return TextFormField(
      keyboardType: type,
      obscureText: point,
      cursorColor: Colors.green,
      controller: controller,
      validator: (value)=>validitorfun(value),





      decoration: InputDecoration(

        label: Text(label,style: TextStyle(
        fontSize: 14,
        fontFamily: "SFProRegular",
        color: Color(0xff929292)
      ),),
        counter:InkWell(
          onTap: (){
            RouterHelper.routerHelper.routingToSpecificWidget(Forget());

          },
          child: Text(Counter,style: TextStyle(
              fontSize: 14,
            fontFamily: "SFProRegular",

          ),),
        ) ,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),





      ),

    );
  }

}
/*
Center(
      child:  SizedBox(
        height: 427,
        width: 344,
        child: Card(
          child: TextField(


            decoration: InputDecoration(
              label: Text("Email"),




            ),

          ),

        ),
      )


    );
 */