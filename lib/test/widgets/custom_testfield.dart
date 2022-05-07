import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String label;
  TextEditingController controller;
  FocusNode myFocusNode = new FocusNode();

  TextInputType textInputType;
  CustomTextfield(
      {this.label, this.controller, this.textInputType = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        cursorColor: Colors.green,
        focusNode: myFocusNode,


        controller: this.controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus ? Colors.green : Colors.grey
            ),


            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),

            label: Text(this.label,),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      )
    );
  }
}
