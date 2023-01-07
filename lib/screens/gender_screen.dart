import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/components/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(text: 'SELECT YOUR ', color: Color(0xff777965),fontWeight: FontWeight.w500,),
                    MyText(text: 'GENDER', color: Color(0xff282b2b),fontWeight: FontWeight.bold,)
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GenderCard(text: 'male',assetImage: AssetImage('assets/images/fun-cartoon-kid-with-rain-gear.jpg'),),
              SizedBox(
                height: 50,
              ),
              GenderCard(text: 'female',assetImage: AssetImage('assets/images/399-3995807_local-company-local-ingredients-healthy-woman-cartoon-png.png'),)
            ],
          ),
        ),
      ),
    );
  }
}
