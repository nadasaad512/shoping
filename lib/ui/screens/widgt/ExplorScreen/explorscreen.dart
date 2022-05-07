import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_store/ui/class/data/data.dart';
import 'package:shopping_store/ui/class/modulas/story.dart';

import '../../../../router_helper.dart';
import 'Gadgets/Gadgetsscreen.dart';

class ExploerScreen extends StatefulWidget {
  @override
  State<ExploerScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<ExploerScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 74.h,
            right: 16.w,
            left: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
                child: TextField(
                  controller: textEditingController,
                  cursorColor: Colors.green,
                  cursorRadius: Radius.circular(50),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    suffix: IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            textEditingController.clear();
                          });
                        },
                        icon: Icon(
                          Icons.close,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(45)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(45)),
                  ),
                ),
              ),
              SizedBox(
                height: 44.h,
              ),
              Text(
                "Categories".tr(),
                style: TextStyle(fontFamily: "SFProBold", fontSize: 18),
              ),
              SizedBox(
                height: 19.h,
              ),
              SizedBox(
                height: 89.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: stores.map((e) {return Cate(story: e);}).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling".tr(),
                    style: TextStyle(fontFamily: "SFProBold", fontSize: 18),
                  ),
                  Text(
                    "See all".tr(),
                    style: TextStyle(fontFamily: "SFProRegular", fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 31.h,
              ),
              SizedBox(
                height: 319.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 180,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: 2,
                  itemBuilder: (_, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/Image.png"))),
                        height: 240,
                        width: 164,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "BeoPlay Speaker",
                        style:
                            TextStyle(fontSize: 16, fontFamily: "SFProMedium"),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Bang and Olufsen",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff929292),
                            fontFamily: "SFProTextRegular"),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "\$755",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff00C569),
                            fontFamily: "SFProMedium"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Cate extends StatelessWidget {
  Story story;
  bool valid=false;

  Cate({this.story,this.valid});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(

      children: [
        InkWell(
          onTap: () {
            RouterHelper.routerHelper.routingToSpecificWidget(GadgetsScreen());

          },
          child: Container(
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Colors.white,
                image: DecorationImage(image: AssetImage(story.image))),
            height: 60.h,
            width: 60.w,
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        Text(
          story.name,
          style: TextStyle(fontSize: 12, fontFamily: "SFProRegular"),
        )
      ],
    );
  }
}
