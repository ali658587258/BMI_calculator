import 'package:bmi_calculator/screens/gender_screen.dart';
import 'package:bmi_calculator/screens/hight_screen.dart';
import 'package:bmi_calculator/screens/weight_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GenderScreen(),
    );
  }
}
