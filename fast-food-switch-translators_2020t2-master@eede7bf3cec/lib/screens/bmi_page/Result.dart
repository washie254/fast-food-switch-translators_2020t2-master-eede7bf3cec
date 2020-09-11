import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  static const String id = 'result_screen';
  final String _Recommended_Daily_Intake;
  ResultScreen(this._Recommended_Daily_Intake);
  @override
  ResultScreenState createState() =>
      ResultScreenState(_Recommended_Daily_Intake);
}

class ResultScreenState extends State<ResultScreen> {
  bool checkboxvalue = false;
  final String _Recommended_Daily_Intake;

  ResultScreenState(@required this._Recommended_Daily_Intake);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("second screen "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 25),
              alignment: Alignment.centerLeft,
              child: Text(
                "Based on the information provided",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Daily Calculated Target Calorie Requirement is ",
                style: TextStyle(fontSize: 60),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 100),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                _Recommended_Daily_Intake,
                style: TextStyle(fontSize: 48),
              ),
            ),
            CheckboxListTile(
              title: Text(
                  "Link your health app with the application to track your exercise. T&C"),
              secondary: Icon(Icons.beach_access),
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.black,
              value: checkboxvalue,
              onChanged: (bool value) {
                setState(() {
                  checkboxvalue = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
