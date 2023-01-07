import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final function;

  NextButton({required this.text,required this.iconData,required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(Color(0xff7aafdf)),
            shape:
            MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            )
        ),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,style: TextStyle(color: Colors.white),),
            Icon(iconData,color: Colors.white,)
          ],
        )
    );
  }
}
