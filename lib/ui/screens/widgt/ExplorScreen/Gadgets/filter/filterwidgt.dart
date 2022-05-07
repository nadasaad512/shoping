import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_store/ui/class/data/filter.dart';
import 'package:shopping_store/ui/class/modulas/filtter.dart';

class FilterWidgt extends StatefulWidget{
  Filter filter;
  FilterWidgt({this.filter});
  @override
  State<FilterWidgt> createState() => _FilterWidgtState();
}

class _FilterWidgtState extends State<FilterWidgt> {
   bool expand = false;
  RangeValues values =RangeValues(10,90);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          setState(() {
            this.expand = value;
          });
        },
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
        title: Text(
         widget.filter.title,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        subtitle: expand
            ? null
            : Container(
          margin: EdgeInsets.only(
            top: 7,
          ),
          child: Text(
            widget.filter.subtitle,
               style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        children:


        [

          Row(
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
          ),
       SliderTheme(

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
                setState(() {
                  this.values=values;
                });
              },

              labels:
              RangeLabels(
                  ("\$  "+values.start.round().toString()),
                  "\$  "+ values.end.round().toString()
              ),



            ),
          )


        ],
      ),
    );

  }

}