import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_store/ui/class/data/filter.dart';
import 'package:shopping_store/ui/class/modulas/filtter.dart';

import 'filterwidgt.dart';

class FilterScreen extends StatefulWidget {
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool expand = false;
RangeValues values =RangeValues(10,90);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [

        Container(
          height: 50.h,


          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                  onPressed: null,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color(0xff00C569),
                          width: 1,

                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                    child: Text(
                      "CLEAR".tr(),
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  )),


              TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                      backgroundColor: Color(0xff00C569)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/FilterScreen');
                  },
                  child: Text(
                    "APPLY".tr(),
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )),
            ],
          ),
        )
      ],
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 80.h,
            left: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                      )),
                  SizedBox(
                    width: 126.w,
                  ),
                  Text(
                    "Filter".tr(),
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              SingleChildScrollView(
                child: Column(
                children: filter.map((e) {return FilterWidgt(filter: e,);}).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}

