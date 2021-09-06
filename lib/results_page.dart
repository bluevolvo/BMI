import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Results extends StatelessWidget {
  final bmiResult;
  final interpretation;
  final status;

  Results ({@required this.bmiResult,@required this.interpretation,@required this.status});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("BMI CALCULATOR"),
      ),
      body:
      Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
                "Your Result",
                style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),
              ),
          ),

              Center(
                child: Container(
                width: 300,
                height: 380,
               decoration: BoxDecoration(
                 color: Colors.amber,
                 borderRadius: BorderRadius.all(Radius.circular(10))
               ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(status,style: TextStyle(color: Colors.green,fontSize: 20),),
                      Text(bmiResult,style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold),),
                      Text(interpretation,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                    ],
                  ),
               ),
              ),


          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child:
              Center(child:
              Text("RE-CALCULATE",
                  style:TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 30,letterSpacing: 1)
              ),
              ),
              width: double.infinity,
              height:kBottomContainerHeight,

              color: kBottomContainerColor,
            ),
          )

        ],
      ),






    );
  }
}
