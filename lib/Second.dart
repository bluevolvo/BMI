import 'package:bmi_app/calculator_logic.dart';
import 'package:flutter/cupertino.dart';
import"package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CardDetails.dart';
import 'ReusableCard.dart';
import 'constants.dart';
import "results_page.dart";

enum Gender {
  male,
  female,
}

 Gender selectedGender;

Color changem = kActiveColor;
Color changef = kActiveColor;

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  int sliderValue = 150;
  int weight =50;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: <Widget> [
                Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },
                  colour: selectedGender==Gender.male ?changem = kInactiveColor: changef = kActiveColor,
                  cardChild: CardDetails(
                    cardIcon: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),
                ),
                  ),



                //2
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour:selectedGender==Gender.female ?changef = kInactiveColor: changem= kActiveColor,

                    cardChild: CardDetails(
                      cardIcon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
             ],
            ),
          ),

          Expanded(
            child: ReusableCard(
              colour: kActiveColor,
              cardChild:Column(
                mainAxisAlignment: MainAxisAlignment.center,
               // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("HEIGHT",style: kLabelStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(sliderValue.toString(),
                        style:kSliderCardStyle,
                      ),
                      Text("cm")
                    ],
                  ),
                Slider(
                  value: sliderValue.toDouble(),
                  onChanged: (double newValue){
                    setState(() {
                 sliderValue =newValue.round();
                 print(sliderValue);
                    });

                  },
                  activeColor: kBottomContainerColor,
                  inactiveColor: Colors.grey[300],
                  max: 180.0,
                  min:10,
                ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(

              children: [
                Expanded(
                  child: ReusableCard(colour: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT",style: kLabelStyle,),
                      Text(
                        weight.toString(),
                        style: kSliderCardStyle,
                      ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(right: 5),
                           child: RoundButton(
                             child:
                           Icon(FontAwesomeIcons.minus,color: Colors.white,),
                             pressed: (){
                               setState(() {
                                 weight--;
                                 print(weight);
                               });
                             },
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 5),
                           child: RoundButton(
                             pressed: (){
                               setState(() {
                                 weight++;
                                 print(weight);
                               });
                             },
                             child:Icon(FontAwesomeIcons.plus,color: Colors.white),
                           ),
                         ),
                       ],
                     ),
                    ],
                  ),
                  ),
                ),

                //2
                Expanded(
                  child:ReusableCard(
                    colour: kActiveColor,
                  cardChild:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE",style: kLabelStyle,),
                      Text(
                        age.toString(),
                        style: kSliderCardStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: RoundButton(
                              child:
                              Icon(FontAwesomeIcons.minus,color: Colors.white,),
                              pressed: (){
                               setState(() {
                                 age--;
                               });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: RoundButton(
                              child:Icon(FontAwesomeIcons.plus,color: Colors.white),
                              pressed: (){
                                setState(() {
                                  age++;
                                },);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Calc calc = Calc(height: sliderValue, weight: weight);

             Navigator.push(context,MaterialPageRoute(builder: (context){
             return Results(
               bmiResult: calc.BMI(),
               interpretation: calc.getInterpretation(),
               status: calc.getResults(),
             );
             },),);
            },
            child: Container(
              child: Center(child: Text("CALCULATE",style:TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 30,letterSpacing: 1))),
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              width: double.infinity,
            ),
          ),
          //TextButton(onPressed: (){}, child: Text("hi"),style: ButtonStyle(),)
        ],
      ),
    );
  }
}


class RoundButton extends StatelessWidget {
  final Widget child;
  final Function pressed;
  RoundButton({this.child,this.pressed,});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      onPressed: pressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
        shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}


