import 'package:fastfoodswitch/widgets/Rounded_button/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class NutritionScreen extends StatefulWidget {
  static const String id = 'nutrition_screen';
  @override
  _NutritionScreenState createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  Widget build(BuildContext context) {
    final _bottomNavigationColor = Colors.blue;
    final Size size = MediaQuery.of(context).size;
    return new FutureBuilder<List<String>>(
        future: Future.wait([
          getEnergyFromDatabase(),
          getProteinFromDatabase(),
          getTotalFatsFromDatabase(),
          getSaturatedFatsFromDatabase(),
          getCarbohydratesFromDatabase(),
          getSugarsFromDatabase(),
          getSodiumFromDatabase(),
          getNameFromDatabase()
        ]),
        initialData: ([
          "loading..",
          "loading..",
          "loading..",
          "loading..",
          "loading..",
          "loading..",
          "loading..",
          "loading..",
        ]),
        builder: (context, AsyncSnapshot<List<String>> text) {
          return new SafeArea(
              child: new Scaffold(
                  appBar: new AppBar(
                    title: new Text(text.data[7]),
                    centerTitle: true,
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home,
                            color: _bottomNavigationColor,
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(color: _bottomNavigationColor),
                          )),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.add,
                            color: _bottomNavigationColor,
                          ),
                          title: Text(
                            "Add",
                            style: TextStyle(color: _bottomNavigationColor),
                          )),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.location_on,
                            color: _bottomNavigationColor,
                          ),
                          title: Text(
                            "Location",
                            style: TextStyle(color: _bottomNavigationColor),
                          ))
                    ],
                    type: BottomNavigationBarType.fixed,
                  ),
                  backgroundColor: Colors.white, // back ground color
                  body: Container(
                    height: size.height,
                    padding: EdgeInsets.fromLTRB(5, 15, 10, 5),
                    child: Column(children: <Widget>[
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              "Nutrition Information",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                          child: ListView(
                        children: ListTile.divideTiles(
                            //          <-- ListTile.divideTiles
                            context: context,
                            tiles: [
                              ListTile(
                                  title: Text('Energy'),
                                  trailing: Text(text.data[0])),
                              ListTile(
                                title: Text('Protein'),
                                trailing: Text(text.data[1]),
                              ),
                              ListTile(
                                title: Text('Total Fat'),
                                trailing: Text(text.data[2]),
                              ),
                              ListTile(
                                title: Padding(
                                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  child: Text(
                                    'Saturated Fats',
                                  ),
                                ),
                                trailing: Text(text.data[3]),
                              ),
                              ListTile(
                                title: Text('Carbohydrates'),
                                trailing: Text(text.data[4]),
                              ),
                              ListTile(
                                title: Padding(
                                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  child: Text(
                                    'Sugars',
                                  ),
                                ),
                                trailing: Text(text.data[5]),
                              ),
                              ListTile(
                                title: Text('Sodium'),
                                trailing: Text(text.data[6]),
                              ),
                            ]).toList(),
                      )),
                      RoundedButton(
                        title: "Add to my meal",
                        width: 300,
                        colour: Colors.lightBlue,
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ]),
                  )));
        });
  }

  String databaseElement = "2";

  Future<String> getData(String path) async {
    String result =
        (await FirebaseDatabase.instance.reference().child(path).once()).value;
    return result;
  }

  Future<String> getNameFromDatabase() async {
    return await getData(databaseElement + "/Name");
  }

  Future<String> getEnergyFromDatabase() async {
    return await getData(databaseElement + "/calories");
  }

  Future<String> getProteinFromDatabase() async {
    return await getData(databaseElement + "/protein");
  }

  Future<String> getTotalFatsFromDatabase() async {
    return await getData(databaseElement + "/total_fats");
  }

  Future<String> getSaturatedFatsFromDatabase() async {
    return await getData(databaseElement + "/saturated_fats");
  }

  Future<String> getCarbohydratesFromDatabase() async {
    return await getData(databaseElement + "/carbohydrates");
  }

  Future<String> getSugarsFromDatabase() async {
    return await getData(databaseElement + "/sugars");
  }

  Future<String> getSodiumFromDatabase() async {
    return await getData(databaseElement + "/sodium");
  }
}
