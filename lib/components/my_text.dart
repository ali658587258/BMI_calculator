import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;


  MyText({required this.text, required this.fontWeight, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: 26,fontWeight: fontWeight,color: color));
  }
}
