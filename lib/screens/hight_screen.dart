import 'package:bmi_calculator/components/button.dart';
import 'package:bmi_calculator/components/next_button.dart';
import 'package:bmi_calculator/components/my_text.dart';
import 'package:bmi_calculator/screens/gender_screen.dart';
import 'package:bmi_calculator/screens/weight_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class HightScreen extends StatefulWidget {


  @override
  State<HightScreen> createState() => _HightScreenState();
}

class _HightScreenState extends State<HightScreen> {
List<bool> isSelected=[true,false];
late WeightSliderController _controller;
double height = 100;

@override
void initState() {
  super.initState();
  _controller = WeightSliderController(initialWeight: height, minWeight: 80, interval: 1);
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 MyText(text: 'SELECT YOUR ', color: Color(0xff777965),fontWeight: FontWeight.w500,),
                  MyText(text: 'HIGHT', color: Color(0xff282b2b),fontWeight: FontWeight.bold,)
                ],
              ),
            ),

            ToggleButtons(
                children:<Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Meter'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Feet'),
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
                              "${height.toInt()}.CM",
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
                                height = value;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> GenderScreen()));
                },),
                NextButton(text: 'NEXT',
                  iconData: Icons.arrow_forward,
                  function: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> WeightScreen(heightPerson: height,)));
                  },),

              ],
            )
          ],
        ),
      ),
    );
  }
}
