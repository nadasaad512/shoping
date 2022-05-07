
import 'package:flutter/material.dart';

class StepperScreen extends StatefulWidget{
  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int cureentstep=0;
  bool iscomplete=false;

  List<Step>getStep()=>[
    Step(
      state: cureentstep>0?StepState.complete:StepState.indexed,
        isActive:cureentstep>=0,
        title: Text("Delivery"),


        content: Container(
          child: ListTile(
           title: Text("Standard Delivery",style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.bold
           ),),
            subtitle: Text("Order will be delivered between 3 - 5 business days",style: TextStyle(
             fontSize: 14,
             color: Colors.black
            ),),

          ),
        )
    ) ,
    Step(
        state: cureentstep>1?StepState.complete:StepState.indexed,
        isActive:cureentstep>=1,
        title: Text("Address"),
        content: Container(
          child: Text('ljked'),
        )
    ),
    Step(
        state: cureentstep>2?StepState.complete:StepState.indexed,
        isActive:cureentstep>=2,
        title: Text("Payments"),
        content: Container()
    )
  ];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,
         centerTitle: true,
         leading:InkWell(
             onTap: (){

             },
             child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
         title:   Text("Checkout",style: TextStyle(
             fontSize: 20,
           color: Colors.black
         ),),
       ),
       body: Container(
     margin:  EdgeInsets.symmetric(vertical: 32),
         child: Theme(
           data: Theme.of(context).copyWith(
             colorScheme: ColorScheme.light(primary: Colors.green),



             canvasColor: Colors.white
           ),
           child: Stepper(
             elevation: 0,


             onStepTapped: (step)=> setState(() {cureentstep=step;}),
             type: StepperType.horizontal,
             currentStep: cureentstep,
             steps: getStep(),


             onStepContinue: (){
               final   isLasStep =cureentstep==getStep().length-1;
             if(isLasStep){
               setState(() {
                 iscomplete==true;
               });
             }else{
               setState(() {
                 cureentstep+=1;
               });
             }

             },
             onStepCancel:  (){
               cureentstep==0?
               null:
               setState(() {
                 cureentstep-=1;
               });

             },
             controlsBuilder:  (BuildContext context, ControlsDetails details) {
               return cureentstep==0?
               Container(
                 margin: EdgeInsets.symmetric(vertical: 500),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children:  [
                     TextButton(
                       style: TextButton.styleFrom(
                           padding: EdgeInsets.symmetric(
                               horizontal: 40,
                               vertical: 16
                           ),

                           backgroundColor: Color(0xff00C569)
                       ),
                       onPressed: details.onStepContinue,
                       child: Text("NEXT",style: TextStyle(
                           color: Colors.white,
                           fontSize: 14

                       ),),
                     ),

                   ],
                 ),
               ):
                 Container(
                 margin: EdgeInsets.symmetric(vertical: 500,horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:  [
                     FlatButton(
                         onPressed: details.onStepCancel,
                         shape: RoundedRectangleBorder(
                             side: BorderSide(
                                 color: Color(0xff00C569),
                                 width: 1,

                                 style: BorderStyle.solid),
                             borderRadius: BorderRadius.circular(4)),
                         child: Padding(
                           padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                           child: Text(
                             "BACK",
                             style: TextStyle(fontSize: 14, color: Colors.black),
                           ),
                         )),
                     TextButton(
                       style: TextButton.styleFrom(
                           padding: EdgeInsets.symmetric(
                               horizontal: 50,
                               vertical: 16
                           ),

                           backgroundColor: Color(0xff00C569)
                       ),
                       onPressed: details.onStepContinue,
                       child: Text(cureentstep==1?"NEXT":"PAY",style: TextStyle(
                           color: Colors.white,
                           fontSize: 14

                       ),),
                     ),

                   ],
                 ),
               );





             },
             // controlsBuilder: ( BuildContext context, { VoidCallback onStepContinue, VoidCallback onStepCancel}) {
             //   return Container(
             //     child: Row(
             //       children: [
             //         TextButton(onPressed: onStepContinue, child: Text("")),
             //         TextButton(onPressed: onStepCancel, child: Text(""))
             //       ],
             //     ),
             //   );
             // },



           ),
         ),
       ),
     );
  }


}


/*
Theme(
           data: Theme.of(context).copyWith(
             colorScheme: ColorScheme.light(primary: Colors.green),



             canvasColor: Colors.white
           ),
           child: Stepper(
             elevation: 0,


             onStepTapped: (step)=> setState(() {cureentstep=step;}),
             type: StepperType.horizontal,
             currentStep: cureentstep,
             steps: getStep(),


             onStepContinue: (){
               final   isLasStep =cureentstep==getStep().length-1;
             if(isLasStep){
               print("bf");
             }else{
               setState(() {
                 cureentstep+=1;
               });
             }

             },
             onStepCancel:  (){
               cureentstep==0?
               null:
               setState(() {
                 cureentstep-=1;
               });

             },
             controlsBuilder:  (BuildContext context, ControlsDetails details) {
               return Container(
              margin: EdgeInsets.symmetric(vertical: 500),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children:  [
                     TextButton(
                       style: TextButton.styleFrom(
                           padding: EdgeInsets.symmetric(
                               horizontal: 40,
                               vertical: 16
                           ),

                           backgroundColor: Color(0xff00C569)
                       ),
                       onPressed: details.onStepContinue,
                       child: Text("NEXT",style: TextStyle(
                         color: Colors.white,
                         fontSize: 14

                       ),),
                     ),

                   ],
                 ),
               );
             },
             // controlsBuilder: ( BuildContext context, { VoidCallback onStepContinue, VoidCallback onStepCancel}) {
             //   return Container(
             //     child: Row(
             //       children: [
             //         TextButton(onPressed: onStepContinue, child: Text("")),
             //         TextButton(onPressed: onStepCancel, child: Text(""))
             //       ],
             //     ),
             //   );
             // },



           ),
         ),
 */
/*

 Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             // Row(
             //   crossAxisAlignment: CrossAxisAlignment.start,
             //   children: [
             //     InkWell(
             //         onTap: (){
             //
             //         },
             //         child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
             //     SizedBox(width: 120,),
             //     Text("Checkout",style: TextStyle(
             //         fontSize: 20
             //     ),)
             //   ],
             // ),
           // SizedBox(height: 56),
             Stepper(
               type: StepperType.horizontal,
                 currentStep: cureentstep,
                 steps: getStep(),
               onStepContinue: (){
                 setState(() {
                   cureentstep+=1;
                 });

               },
               onStepCancel:  (){
                 setState(() {
                   cureentstep-=1;
                 });

               },



             )
           ],
         )
 */