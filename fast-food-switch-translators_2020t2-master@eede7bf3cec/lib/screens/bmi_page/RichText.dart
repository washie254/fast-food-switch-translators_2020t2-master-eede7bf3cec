
import 'package:flutter/material.dart';

class User_RichText extends StatelessWidget{
  final String measurement;
  final String Unit;
  User_RichText(this.measurement,this.Unit);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2,
      alignment: Alignment.center,
      padding: EdgeInsets.all(25),
      child: RichText(
        text: TextSpan(
            style: TextStyle(fontSize: 18,color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: measurement,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              TextSpan(text: Unit)
            ]),
      ),
    );
  }
}