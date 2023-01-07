import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  final double bmiPerson;
  Bmi({required this.bmiPerson,Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BMI = ${widget.bmiPerson}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Color(0xff7aafdf)),)
            ],
          ),
        ),
      ),
    );
  }
}
