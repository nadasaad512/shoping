

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_store/ui/screens/widgt/cart.dart';
import 'package:shopping_store/ui/screens/widgt/profile/person.dart';


import 'widgt/ExplorScreen/explorscreen.dart';


class MainScreen extends StatefulWidget{
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentindex=0;
  List<Widget> widgetoptional =

  [
    ExploerScreen(),
    CartScreen(),
    PersonalScreen(),



  ];
  @override
  Widget build(BuildContext context) {



    return Scaffold(
        body: widgetoptional.elementAt(currentindex),

        bottomNavigationBar:SizedBox(
          height: 84,
          child: BottomNavigationBar(


              items: [
                BottomNavigationBarItem(icon:Text("Explore".tr(),style: TextStyle(
                  fontFamily: "SFProBold",
                  fontSize: 14
                ),),label: ".",),
                BottomNavigationBarItem(icon: SvgPicture.asset("assets/Icon_Cart.svg"),label: "."),
                BottomNavigationBarItem(icon: SvgPicture.asset("assets/Icon_User.svg"),label: ".",),




              ],


              currentIndex: currentindex,

              selectedFontSize: 20,
              showUnselectedLabels: false,
              selectedItemColor:Colors.black87,
              unselectedItemColor: Colors.grey.shade700,
              elevation: 10,




              onTap: (int value){
                setState(() {
                  currentindex=value;
                });
              }

          ),
        )
    );
  }
}