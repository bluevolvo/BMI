import 'package:flutter/material.dart';
import 'dart:math';
class  Calc {
 final int height;
 final  int weight;
 double _bmi;

 Calc({this.height,this.weight});
 String  BMI (){
  _bmi = weight/ pow(height/100, 2);
  return _bmi.toStringAsFixed(1);
 }

 String getResults (){
   if(_bmi<=25){
     return "OverWeight";
   }else if(_bmi>18.5){
     return "Normal";
   }else{
     return"UnderWeight";
   }
 }

 String getInterpretation () {
   if(_bmi<=25){
     return "You need to check your weight";
   }else if(_bmi>18.5){
     return "Good job! You have a normal weight";
   }else{
     return"You're underweight";
   }
}


}
