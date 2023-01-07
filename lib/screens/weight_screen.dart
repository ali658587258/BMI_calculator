import 'package:bmi_calculator/screens/hight_screen.dart';
import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../components/button.dart';
import '../components/my_text.dart';
import '../components/next_button.dart';
import 'bmi.dart';

class WeightScreen extends StatefulWidget {
  final double heightPerson;
  WeightScreen({required this.heightPerson,Key? key}): super(key: key) ;

  @override
  State<WeightScreen> createState() => _WieghtScreenState();
}

class _WieghtScreenState extends State<WeightScreen> {
  List<bool> isSelected=[true,false];
  late WeightSliderController _controller;
  double weight = 50;
  late double bmi;
  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(initialWeight: weight, minWeight: 20, interval: 0.1);
  }
@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(text: 'SELECT YOUR ', color: Color(0xff777965),fontWeight: FontWeight.w500,),
                    MyText(text: 'WEIGHT', color: Color(0xff282b2b),fontWeight: FontWeight.bold,)
                  ],
                ),
              ),

              ToggleButtons(
                children:<Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('KGS'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('LBS'),
                  )
                ] ,
                constraints: BoxConstraints(
                    minWidth: 80
                ),
                borderRadius: BorderRadius.circular(20),
                borderWidth: 1,
                selectedColor: Colors.white,
                fillColor: Color(0xff7ab0df),
                color: Colors.black54,
                isSelected: isSelected,
                renderBorder: true,
                onPressed: (int newIndex){
                  setState(() {
                    for(int index = 0; index < isSelected.length;index++)
                    {
                      if(index == newIndex)
                      {
                        isSelected[index]=true;
                      }
                      else{
                        isSelected[index]=false;
                      }
                    }
                  });
                },
              ),
              // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: Text(
                          "${weight.toString()}KG",
                          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500,color: Color(0xff7aafdf)),
                        ),
                      ),
                      VerticalWeightSlider(
                        controller: _controller,
                        decoration: const PointerDecoration(
                          width: 130.0,
                          height: 5.0,
                          largeColor: Color(0xFF898989),
                          mediumColor: Color(0xFFC5C5C5),
                          smallColor: Color(0xFFF0F0F0),
                          gap: 30.0,
                        ),
                        onChanged: (double value) {
                          setState(() {
                            weight = value;
                          });
                        },
                        indicator: Container(
                          height: 3.0,
                          width: 200.0,
                          alignment: Alignment.centerLeft,
                          color: Colors.red[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(function: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HightScreen()));
                  },),
                  NextButton(
                    text: 'CALCULATE BMI',
                    iconData: Icons.add_box,
                    function: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Bmi(bmiPerson: bmi)));
                        double higeht = widget.heightPerson/100;
                        bmi=weight/(higeht*higeht);
                        print(bmi);
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
      
    }
  }