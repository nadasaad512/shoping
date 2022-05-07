import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/ui/class/modulas/filtter.dart';
RangeValues values =RangeValues(10,90);
List<Filter> filter=
[
  Filter(title: "Popularity".tr(),subtitle: "No Setting".tr(),widget: Text("")),
  Filter(title: "Brands".tr(),subtitle: "Apple, Samsung, Huawei, B&o ".tr(),widget: Text("")),
  Filter(title: "Price".tr(),subtitle: "",widget:   SliderTheme(

    data: SliderThemeData(
      // thumbSelector: ,
        trackHeight: 2,
        valueIndicatorColor: Color(0xff00C569),
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),

        thumbColor: Colors.green,
        overlayColor: Colors.green.withOpacity(0.1),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

        activeTrackColor: Colors.grey.shade200,
        inactiveTrackColor: Colors.grey.shade200,
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent
    ),
    child: RangeSlider(

      values: values,
      min: 0,
      max: 100,
      divisions: 20,

      onChanged: (values){
        // setState(() {
        //   this.values=values;
        // });
      },

      labels:
      RangeLabels(
          ("\$  "+values.start.round().toString()),
          "\$  "+ values.end.round().toString()
      ),



    ),
  )),
  Filter(title: "Color".tr(),subtitle: "No Setting".tr(),widget: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(8)),
      ),
      Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(8)),
      ),
      Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(8)),
      ),
      Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(8)),
      ),
      Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(8)),
      ),
      Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(8)),
      ),
    ],
  )),
  Filter(title: "Rating".tr(),subtitle: "4 Star".tr(),widget: Text("")),
  Filter(title: "Shipped From".tr(),subtitle: "No Setting".tr(),widget: Text("")),



];