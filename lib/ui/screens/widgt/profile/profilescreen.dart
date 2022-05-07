
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_store/ui/screens/widgt/profile/person.dart';
import 'package:shopping_store/ui/screens/widgt/profile/provider.dart';

import '../../../../router_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(

          height: size.height ,
          decoration: BoxDecoration(
              color: Colors.purple.shade300,
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.centerEnd,
                colors: [
                  Colors.green.shade900,
                  Colors.grey,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )

              ),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      RouterHelper.routerHelper.routingToSpecificWidget(PersonalScreen());                    //  RouterHelper.routerHelper.pushToSpecificScreenByName( 'PersonalScreen');
                    //  Navigator.pushNamed(context,'/PersonalScreen');
                      //RouterHelper.routerHelper.routingToSpecificWidget(PersonalScreen());
                    }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,)),


                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Consumer<CameraProvider>(builder: (contexr, provider, x)
                  {
                    return  Stack(
                      children: [

                        InkWell(
                          onTap: () {
                            provider.selectSource(context);


                          },
                          child: Container(

                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle


                              ),
                              height: 150,
                              width: 300,

                              child: provider.file == null
                                  ? Container()
                                  : CircleAvatar(

                                backgroundImage: FileImage(provider.file),
                                radius: 20,
                              )
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            right: 30,
                            left: 150,
                            child: IconButton(
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                onPressed: () {
                                  print("dk");
                                  // provider.selectSource(context);
                                }))

                      ],
                    );

                  }
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Nada Sami Saad",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser.email,
                    style: TextStyle(
                      color: Colors.white,
                      //color: Colors.black
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  card({String title, IconData image}) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.centerEnd,
            colors: [
              Colors.blue.shade900,
              Colors.purple,
            ],
          ),
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: IconButton(
            icon: Icon(image,
                size: 25, color: Colors.white),
            onPressed: () {}),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400),
        ),
        trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () {
            //  Provider.of<AuthProvider>(context, listen: false).logOut();
            }),
      ),
    );
  }
}
