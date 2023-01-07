import 'package:bmi_calculator/screens/hight_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
final String text;
final AssetImage assetImage;

GenderCard({required this.text,required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HightScreen()));

        },
        child: Container(
            width: 200,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: assetImage,
                    radius: 50,
                  ),
                  Text(text)
                ],
              ),
            )
        ),
      ),
    );
  }
}
