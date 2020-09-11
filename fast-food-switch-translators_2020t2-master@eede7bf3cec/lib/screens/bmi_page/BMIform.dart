import 'package:fastfoodswitch/screens/bmi_page/Bmi_Bloc.dart';
import 'package:fastfoodswitch/screens/bmi_page/RichText.dart';
import 'package:flutter/material.dart';
import './RichText.dart';
import './Result.dart';
import '../../models/BMIform_Data.dart';

class BMIformScreen extends StatefulWidget {
  static const String id = 'bmi_screen';
  @override
  BMIformScreenState createState() => BMIformScreenState();
}

class BMIformScreenState extends State<BMIformScreen> {
  BMIform_data data = BMIform_data();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void calculate() {
    print(int.parse(data.target_Time));
    Bmi_Blocc backend = Bmi_Blocc(
        int.parse(data.user_Weight.text),
        int.parse(data.user_Age.text),
        int.parse(data.user_Height.text),
        data.gender,
        data.physicalActivity,
        int.parse(data.Kg_to_lose.text),
        int.parse(data.target_Time));
    backend.calculate_daily_requirement();
    String calculated_result = backend.result.toString();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ResultScreen(calculated_result)));
  }

  bool CheckUserInput() {
    //will return null if cannot conver to int, user_height is a textEdittingcontroller
    data.user_Height_int = int.tryParse(data.user_Height.text);
    data.user_Weight_int = int.tryParse(data.user_Weight.text);
    data.user_Age_int = int.tryParse(data.user_Age.text);
    data.KgToLose_int = int.tryParse(data.Kg_to_lose.text);
    //check if the value is valid if not display error message to user
    if (data.user_Height_int == null ||
        data.user_Height_int < 0 ||
        data.user_Height_int == 0) {
      String _ = "User height is not valid";
      print(_);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(_),
      ));

      return false;
    }
    if (data.user_Weight_int == null ||
        data.user_Weight_int < 0 ||
        data.user_Weight_int == 0) {
      String _ = "User weight is not valid";
      print(_);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(_),
      ));
      return false;
    }
    if (data.user_Age_int == null ||
        data.user_Age_int < 0 ||
        data.user_Age_int == 0) {
      String _ = "User age is not valid";
      print(_);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(_),
      ));
      return false;
    }
    if (data.Kg_to_lose == null ||
        data.KgToLose_int < 0 ||
        data.KgToLose_int == 0) {
      String _ = "Weight to lose is not valid";
      print(_);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(_),
      ));
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    int _height = (MediaQuery.of(context).size.height * 0.2).round();
    int _widht = (MediaQuery.of(context).size.height * 0.2).round();
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    //if the use already select change the color of the other card to transparent and change this card to red
                    if (data.Selected == true) {
                      setState(() {
                        data.Card2_Color = Colors.white;
                        data.Card1_Color = Colors.red;
                      });
                    } else if (data.Selected == false) {
                      setState(() {
                        data.Card1_Color = Colors.red;
                      });
                      data.Selected = true;
                    }
                    data.gender = "male";
                  },
                  child: Card(
                    shape: StadiumBorder(
                        side: BorderSide(color: data.Card1_Color, width: 5)),
                    elevation: 5,
                    child: Image.asset(
                      'assets/images/male.png',
                      cacheHeight: _height,
                      cacheWidth: _widht,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //if the use already select change the color of the other card to transparent and change this card to red
                    if (data.Selected == true) {
                      setState(() {
                        data.Card1_Color = Colors.white;
                        data.Card2_Color = Colors.red;
                      });
                    } else if (data.Selected == false) {
                      setState(() {
                        data.Card1_Color = Colors.red;
                      });
                      data.Selected = true;
                    }
                    data.gender = "female";
                  },
                  child: Card(
                      shape: StadiumBorder(
                          side: BorderSide(color: data.Card2_Color, width: 5)),
                      elevation: 5,
                      child: Image.asset(
                        'assets/images/female.png',
                        cacheHeight: _height,
                        cacheWidth: _height,
                      )),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                children: <Widget>[
                  User_RichText("Height", "(Cm)"),
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: data.user_Height))
                ],
              ),
            ),
            Row(
              children: <Widget>[
                User_RichText("Weight", "(Kg)"),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        controller: data.user_Weight))
              ],
            ),
            Row(
              children: <Widget>[
                User_RichText("Age", ""),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        controller: data.user_Age))
              ],
            ),
            Row(
              children: <Widget>[
                User_RichText("Weight to lose", "(Kg)"),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        controller: data.Kg_to_lose))
              ],
            ),
            Row(
              children: <Widget>[
                User_RichText("Target time", "(Month)"),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: DropdownButton(
                      value: data.target_Time,
                      isExpanded: true,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (String newValue) {
                        setState(() {
                          data.target_Time = newValue;
                        });
                      },
                      items: data.monthlist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                )
              ],
            ),
            Row(
              children: <Widget>[
                User_RichText("Physical Activity", ""),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: DropdownButton(
                      value: data.physicalActivity,
                      isExpanded: true,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (String newValue) {
                        setState(() {
                          data.physicalActivity = newValue;
                        });
                      },
                      items: data.physicalActivity_List
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                )
              ],
            ),
            FlatButton(
              child: Text("Calculate"),
              onPressed: () {
                if (CheckUserInput()) {
                  calculate();
                } else {
                  print("CheckUserInput fucntion return false");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
//              Scaffold.of(context).showSnackBar(SnackBar(content: Text("it worked"),));
