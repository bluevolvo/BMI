import "package:flutter/material.dart";
import 'constants.dart';

class CardDetails extends StatelessWidget {
  final IconData cardIcon;
  final String label;

  CardDetails({this.cardIcon, this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(cardIcon,
         color: kIconStyle,
         size: kIconSize ,
        ),
        Text(label,style:kLabelStyle),


      ],

    );
  }
}