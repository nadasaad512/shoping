import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Verification extends StatefulWidget{
  @override
  State<Verification> createState() => _VerificationState();
}



class _VerificationState extends State<Verification> {
  FocusNode _firstFocusNode;
  FocusNode _secondFocusNode;
  FocusNode _thirdFocusNode;
  FocusNode _fourthFocusNode;
  @override
  void initState() {
    super.initState();


    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();


    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: 88,
              left: 16,
              right: 16,

          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
              SizedBox(height:32 ,),
              Card(
                shadowColor: Colors.white,
                elevation: 50,
                child: Container(
                  margin: EdgeInsets.only(
                      top: 11,
                      left: 16,
                      right: 16,
                      bottom: 16
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Verification",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                      SizedBox(height: 9,),
                      Text("A 6 - Digit PIN has been sent to your email\n address, enter it below to continue",style: TextStyle(
                          fontSize: 14,
                        color: Colors.grey
                      ),),
                      SizedBox(height:57 ,),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              //controller: _firstCodeTextController,
                              focusNode: _firstFocusNode,
                              maxLength: 1,
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold
                              ),
                              cursorColor: Colors.green,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (String value) {
                                if (value.isNotEmpty) _secondFocusNode.requestFocus();
                              },
                              decoration: InputDecoration(
                                counterText: '',

                                enabledBorder: _border,
                                focusedBorder: _border,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                             // controller: _secondCodeTextController,
                              focusNode: _secondFocusNode,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold
                              ),
                              maxLength: 1,
                              cursorColor: Colors.green,

                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (String value) {
                                if (value.isNotEmpty)
                                  _thirdFocusNode.requestFocus();
                                else
                                  _firstFocusNode.requestFocus();
                              },
                              decoration: InputDecoration(
                                counterText: '',
                                enabledBorder: _border,
                                focusedBorder: _border,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              //controller: _thirdCodeTextController,
                              focusNode: _thirdFocusNode,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold
                              ),
                              maxLength: 1,
                              cursorColor: Colors.green,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (String value) {
                                if (value.isNotEmpty)
                                  _fourthFocusNode.requestFocus();
                                else
                                  _secondFocusNode.requestFocus();
                              },
                              decoration: InputDecoration(
                                counterText: '',
                                enabledBorder: _border,
                                focusedBorder: _border,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                             // controller: _fourthCodeTextController,
                              focusNode: _fourthFocusNode,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold
                              ),
                              maxLength: 1,
                              cursorColor: Colors.green,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (String value) {
                                if (value.isEmpty) _thirdFocusNode.requestFocus();
                              },
                              decoration: InputDecoration(
                                counterText: '',
                                enabledBorder: _border,
                                focusedBorder: _border,
                              ),
                            ),
                          ),
                        ],
                      ),




                      SizedBox(height:66 ,),
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(top: 15, bottom: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            primary: Color(0xff00C569)),
                        child: Center(child: Text("CONTINUE")),
                      )


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  OutlineInputBorder get _border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey.shade500,
      ),
    );
  }
}