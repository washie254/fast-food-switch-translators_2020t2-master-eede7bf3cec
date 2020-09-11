
import 'package:fastfoodswitch/screens/api_test/user_api.dart';
import 'package:fastfoodswitch/screens/device_detail/device%20detail.dart';
import 'package:fastfoodswitch/screens/home/food%20type/lunch.dart';
import 'package:fastfoodswitch/screens/notifier/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fastfoodswitch/screens/home/test.dart';
import 'package:fastfoodswitch/screens/home/food type/Breakfast.dart';
import 'package:fastfoodswitch/screens/home/food%20type/Dinner.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _bottomNavigationColor = Colors.blue;



  @override
  void initState() {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context, listen: false);
    getUser(userNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    DeviceSizeFit.initialize(context);

    //backend userdata
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);

    var data = [
      Sales("Intake", userNotifier.userList[0].daily_kj_intake, Colors.red),
      Sales("Require", userNotifier.userList[0].daily_kj_retuqire-userNotifier.userList[0].daily_kj_intake, Colors.grey[100]),
    ];

    var series = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.day,
          measureFn: (Sales sales, _) => sales.sold,
          colorFn: (Sales sales, _) => sales.color,
          id: 'Sales',
          data: data,

          labelAccessorFn: (Sales sales, _) => '${sales.day} : ${sales.sold
              .toString()}'

      )
    ];

    var chart = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(
          arcWidth: 7
      ),
      animate: true,
    );


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          //cancel  shadow
          leading: Icon(Icons.fastfood, color: Colors.blue,),
          //leading: GestureDetector(child: Icon(Icons.fastfood,color: Colors.blue,),onTap: (){},),
          title: Text("test"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              color: Colors.blue,
              onPressed: () {
                showDialog(context: context, builder: (_) => Feedbackscreen());
              },
            )
          ],
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
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: _bottomNavigationColor,
                ),
                title: Text(
                  "Add",
                  style: TextStyle(color: _bottomNavigationColor),
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.location_on,
                  color: _bottomNavigationColor,
                ),
                title: Text(
                  "Location",
                  style: TextStyle(color: _bottomNavigationColor),
                )
            )
          ],

          type: BottomNavigationBarType.fixed,
        ),
        backgroundColor: Colors.white, // back ground color

        body: ListView( //scow
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          margin: EdgeInsets.all(10),
                          constraints: BoxConstraints.tightFor(
                              width: DeviceSizeFit.setPx(350.0), height: DeviceSizeFit.setRpx(760)),
                          //size

                          decoration: BoxDecoration(
                              color: Colors.white, //box color
                              border: Border.all(
                                  color: Colors.black12, width: 0.5),
                              borderRadius: BorderRadius.circular(50),

                              boxShadow: [ //shadow
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 2),
                                    blurRadius: 10.0
                                )
                              ]
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("5800",style: TextStyle(fontSize: DeviceSizeFit.setPx(15), color: Colors.black)),
                                      Text("Consumed (kJ)",style: TextStyle(fontSize: DeviceSizeFit.setPx(11), color: Colors.black)),

                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          SizedBox(height: DeviceSizeFit.setRpx(372),
                                              width: DeviceSizeFit.setPx(186),
                                              child: chart),
                                          Column(
                                            children: <Widget>[
                                              Text(userNotifier.userList[0].daily_kj_intake.toString()+'/'+userNotifier.userList[0].daily_kj_retuqire.toString()),
                                              Text("kj",style: TextStyle(fontSize: DeviceSizeFit.setPx(15), color: Colors.black)),
                                              Text("Remaining",style: TextStyle(fontSize: DeviceSizeFit.setPx(11), color: Colors.black)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("2600",style: TextStyle(fontSize: DeviceSizeFit.setPx(14), color: Colors.black)),
                                      Text("Burned(kj)",style: TextStyle(fontSize: DeviceSizeFit.setPx(10), color: Colors.black)),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          SizedBox(height:  DeviceSizeFit.setRpx(230),
                                              width: DeviceSizeFit.setPx(110),
                                              child: chart),
                                          Text("60%",style: TextStyle(fontSize: DeviceSizeFit.setPx(14), color: Colors.black)),
                                        ],
                                      ),
                                      Text("Fat",style: TextStyle(fontSize: DeviceSizeFit.setPx(14), color: Colors.black)),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          SizedBox(height:  DeviceSizeFit.setRpx(230),
                                              width: DeviceSizeFit.setPx(110),
                                              child: chart),
                                          Text("77%",style: TextStyle(fontSize: DeviceSizeFit.setPx(14), color: Colors.black)),
                                        ],
                                      ),
                                      Text("Sugar",style: TextStyle(fontSize: DeviceSizeFit.setPx(14), color: Colors.black)),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          SizedBox(height:  DeviceSizeFit.setRpx(230),
                                              width: DeviceSizeFit.setPx(110),
                                              child: chart),
                                          Text("88%",style: TextStyle(fontSize: DeviceSizeFit.setPx(14), color: Colors.black)),
                                        ],
                                      ),
                                      Text("Sodium",style: TextStyle(fontSize: DeviceSizeFit.setPx(14), color: Colors.black)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),

                        ),

                        //breakfast
                        Container(

                          margin: EdgeInsets.all(10),
                          constraints: BoxConstraints.tightFor(
                              width: DeviceSizeFit.setPx(350.0), height: DeviceSizeFit.setRpx(500)), //size

                          decoration: BoxDecoration(
                              color: Colors.white, //box color
                              border: Border.all(
                                  color: Colors.black12, width:DeviceSizeFit.setPx(0.5)),
                              borderRadius: BorderRadius.circular(50),

                              boxShadow: [ //shadow
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 2),
                                    blurRadius: 10.0
                                )
                              ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(icon: Icon(Icons.keyboard_arrow_up),
                                        onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => BreakfastScreen()));}),
                                    SizedBox(width: DeviceSizeFit.setPx(20)),
                                  ]
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text("Breakfast"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: Text("2141.95 kj"),
                                  ),
                                ],
                              ),

                              Row( //food card
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    constraints: BoxConstraints.tightFor(
                                        width: DeviceSizeFit.setPx(330.0), height: DeviceSizeFit.setRpx(90)), //size
                                    decoration: BoxDecoration(
                                        color: Colors.white, //box color
                                        border: Border.all(
                                            color: Colors.black12, width: DeviceSizeFit.setPx(0.5)),

                                        boxShadow: [ //shadow
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 2),
                                              blurRadius: 10.0
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/131-1314271_food-icon-food-court-icon-png.png'),
                                            )
                                        ),
                                        SizedBox(width:  DeviceSizeFit.setPx(10),),
                                        Container(
                                          width:  DeviceSizeFit.setPx(180),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Mocha", style: TextStyle(
                                                  fontSize: DeviceSizeFit.setPx(15))),

                                              Text("Fusion Cafe, 200 ml",
                                                style: TextStyle(fontSize: DeviceSizeFit.setPx(10),
                                                    color: Colors.grey),),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                          child: Text(
                                            "1221.95 kj",
                                            style: TextStyle(fontSize: DeviceSizeFit.setPx(13),
                                                color: Colors.blue),),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row( //food card
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    constraints: BoxConstraints.tightFor(
                                        width: DeviceSizeFit.setPx(330.0), height: DeviceSizeFit.setRpx(90)), //size
                                    decoration: BoxDecoration(
                                        color: Colors.white, //box color
                                        border: Border.all(
                                            color: Colors.black12, width: DeviceSizeFit.setPx(0.5)),

                                        boxShadow: [ //shadow
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 2),
                                              blurRadius: 10.0
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/131-1314271_food-icon-food-court-icon-png.png'),
                                            )
                                        ),
                                        SizedBox(width:  DeviceSizeFit.setPx(10),),
                                        Container(
                                          width:  DeviceSizeFit.setPx(180),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Croissants", style: TextStyle(
                                                  fontSize: DeviceSizeFit.setPx(15))),

                                              Text("Fusion Cafe,  1 piece",
                                                style: TextStyle(fontSize: DeviceSizeFit.setPx(10),
                                                    color: Colors.grey),),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                          child: Text(
                                            "920 kJ",
                                            style: TextStyle(fontSize: DeviceSizeFit.setPx(13),
                                                color: Colors.blue),),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row( //food card
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    constraints: BoxConstraints.tightFor(
                                        width: DeviceSizeFit.setPx(330.0), height: DeviceSizeFit.setRpx(90)), //size
                                    decoration: BoxDecoration(
                                        color: Colors.white, //box color
                                        border: Border.all(
                                            color: Colors.black12, width: DeviceSizeFit.setPx(0.5)),

                                        boxShadow: [ //shadow
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 2),
                                              blurRadius: 10.0
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/131-1314271_food-icon-food-court-icon-png.png'),
                                            )
                                        ),
                                        SizedBox(width:  DeviceSizeFit.setPx(10),),
                                        Container(
                                          width:  DeviceSizeFit.setPx(180),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Add", style: TextStyle(
                                                  fontSize: DeviceSizeFit.setPx(15))),

                                              Text("",
                                                style: TextStyle(fontSize: DeviceSizeFit.setPx(10),
                                                    color: Colors.grey),),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                          child: Text(
                                            "",
                                            style: TextStyle(fontSize: DeviceSizeFit.setPx(13),
                                                color: Colors.blue),),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        //lunch
                        Container(

                          margin: EdgeInsets.all(10),
                          constraints: BoxConstraints.tightFor(
                              width: DeviceSizeFit.setPx(350.0), height: DeviceSizeFit.setRpx(500)), //size

                          decoration: BoxDecoration(
                              color: Colors.white, //box color
                              border: Border.all(
                                  color: Colors.black12, width:DeviceSizeFit.setPx(0.5)),
                              borderRadius: BorderRadius.circular(50),

                              boxShadow: [ //shadow
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 2),
                                    blurRadius: 10.0
                                )
                              ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(icon: Icon(Icons.keyboard_arrow_up),
                                        onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => LunchScreen()));}),
                                    SizedBox(width: DeviceSizeFit.setPx(20)),
                                  ]
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text("Lunch"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: Text("1830.22 kJ"),
                                  ),
                                ],
                              ),

                              Row( //food card
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    constraints: BoxConstraints.tightFor(
                                        width: DeviceSizeFit.setPx(330.0), height: DeviceSizeFit.setRpx(90)), //size
                                    decoration: BoxDecoration(
                                        color: Colors.white, //box color
                                        border: Border.all(
                                            color: Colors.black12, width: DeviceSizeFit.setPx(0.5)),

                                        boxShadow: [ //shadow
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 2),
                                              blurRadius: 10.0
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/131-1314271_food-icon-food-court-icon-png.png'),
                                            )
                                        ),
                                        SizedBox(width:  DeviceSizeFit.setPx(10),),
                                        Container(
                                          width:  DeviceSizeFit.setPx(180),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Mocha", style: TextStyle(
                                                  fontSize: DeviceSizeFit.setPx(15))),

                                              Text("Fusion Cafe, 200 ml",
                                                style: TextStyle(fontSize: DeviceSizeFit.setPx(10),
                                                    color: Colors.grey),),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                          child: Text(
                                            "1221.95 kj",
                                            style: TextStyle(fontSize: DeviceSizeFit.setPx(13),
                                                color: Colors.blue),),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row( //food card
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    constraints: BoxConstraints.tightFor(
                                        width: DeviceSizeFit.setPx(330.0), height: DeviceSizeFit.setRpx(90)), //size
                                    decoration: BoxDecoration(
                                        color: Colors.white, //box color
                                        border: Border.all(
                                            color: Colors.black12, width: DeviceSizeFit.setPx(0.5)),

                                        boxShadow: [ //shadow
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 2),
                                              blurRadius: 10.0
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/131-1314271_food-icon-food-court-icon-png.png'),
                                            )
                                        ),
                                        SizedBox(width:  DeviceSizeFit.setPx(10),),
                                        Container(
                                          width:  DeviceSizeFit.setPx(180),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Croissants", style: TextStyle(
                                                  fontSize: DeviceSizeFit.setPx(15))),

                                              Text("Fusion Cafe,  1 piece",
                                                style: TextStyle(fontSize: DeviceSizeFit.setPx(10),
                                                    color: Colors.grey),),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                          child: Text(
                                            "920 kJ",
                                            style: TextStyle(fontSize: DeviceSizeFit.setPx(13),
                                                color: Colors.blue),),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row( //food card
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    constraints: BoxConstraints.tightFor(
                                        width: DeviceSizeFit.setPx(330.0), height: DeviceSizeFit.setRpx(90)), //size
                                    decoration: BoxDecoration(
                                        color: Colors.white, //box color
                                        border: Border.all(
                                            color: Colors.black12, width: DeviceSizeFit.setPx(0.5)),

                                        boxShadow: [ //shadow
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 2),
                                              blurRadius: 10.0
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/131-1314271_food-icon-food-court-icon-png.png'),
                                            )
                                        ),
                                        SizedBox(width:  DeviceSizeFit.setPx(10),),
                                        Container(
                                          width:  DeviceSizeFit.setPx(180),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Add", style: TextStyle(
                                                  fontSize: DeviceSizeFit.setPx(15))),

                                              Text("",
                                                style: TextStyle(fontSize: DeviceSizeFit.setPx(10),
                                                    color: Colors.grey),),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                          child: Text(
                                            "",
                                            style: TextStyle(fontSize: DeviceSizeFit.setPx(13),
                                                color: Colors.blue),),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        //dinner
                        Container(

                          margin: EdgeInsets.all(10),
                          constraints: BoxConstraints.tightFor(
                              width: DeviceSizeFit.setPx(350.0), height: DeviceSizeFit.setRpx(500)), //size

                          decoration: BoxDecoration(
                              color: Colors.white, //box color
                              border: Border.all(
                                  color: Colors.black12, width:DeviceSizeFit.setPx(0.5)),
                              borderRadius: BorderRadius.circular(50),

                              boxShadow: [ //shadow
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 2),
                                    blurRadius: 10.0
                                )
                              ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(icon: Icon(Icons.keyboard_arrow_up),
                                        onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => DinnerScreen()));}),
                                    SizedBox(width: DeviceSizeFit.setPx(20)),
                                  ]
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text("Dinner"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: Text("1830.22 kJ"),
                                  ),
                                ],
                              ),

                              Row( //food card
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    constraints: BoxConstraints.tightFor(
                                        width: DeviceSizeFit.setPx(330.0), height: DeviceSizeFit.setRpx(90)), //size
                                    decoration: BoxDecoration(
                                        color: Colors.white, //box color
                                        border: Border.all(
                                            color: Colors.black12, width: DeviceSizeFit.setPx(0.5)),

                                        boxShadow: [ //shadow
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 2),
                                              blurRadius: 10.0
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/131-1314271_food-icon-food-court-icon-png.png'),
                                            )
                                        ),
                                        SizedBox(width:  DeviceSizeFit.setPx(10),),
                                        Container(
                                          width:  DeviceSizeFit.setPx(180),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Mocha", style: TextStyle(
                                                  fontSize: DeviceSizeFit.setPx(15))),

                                              Text("Fusion Cafe, 200 ml",
                                                style: TextStyle(fontSize: DeviceSizeFit.setPx(10),
                                                    color: Colors.grey),),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                          child: Text(
                                            "1221.95 kj",
                                            style: TextStyle(fontSize: DeviceSizeFit.setPx(13),
                                                color: Colors.blue),),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row( //food card
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    constraints: BoxConstraints.tightFor(
                                        width: DeviceSizeFit.setPx(330.0), height: DeviceSizeFit.setRpx(90)), //size
                                    decoration: BoxDecoration(
                                        color: Colors.white, //box color
                                        border: Border.all(
                                            color: Colors.black12, width: DeviceSizeFit.setPx(0.5)),

                                        boxShadow: [ //shadow
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 2),
                                              blurRadius: 10.0
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/131-1314271_food-icon-food-court-icon-png.png'),
                                            )
                                        ),
                                        SizedBox(width:  DeviceSizeFit.setPx(10),),
                                        Container(
                                          width:  DeviceSizeFit.setPx(180),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Croissants", style: TextStyle(
                                                  fontSize: DeviceSizeFit.setPx(15))),

                                              Text("Fusion Cafe,  1 piece",
                                                style: TextStyle(fontSize: DeviceSizeFit.setPx(10),
                                                    color: Colors.grey),),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                          child: Text(
                                            "920 kJ",
                                            style: TextStyle(fontSize: DeviceSizeFit.setPx(13),
                                                color: Colors.blue),),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row( //food card
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    constraints: BoxConstraints.tightFor(
                                        width: DeviceSizeFit.setPx(330.0), height: DeviceSizeFit.setRpx(90)), //size
                                    decoration: BoxDecoration(
                                        color: Colors.white, //box color
                                        border: Border.all(
                                            color: Colors.black12, width: DeviceSizeFit.setPx(0.5)),

                                        boxShadow: [ //shadow
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 2),
                                              blurRadius: 10.0
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/images/131-1314271_food-icon-food-court-icon-png.png'),
                                            )
                                        ),
                                        SizedBox(width:  DeviceSizeFit.setPx(10),),
                                        Container(
                                          width:  DeviceSizeFit.setPx(180),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Add", style: TextStyle(
                                                  fontSize: DeviceSizeFit.setPx(15))),

                                              Text("",
                                                style: TextStyle(fontSize: DeviceSizeFit.setPx(10),
                                                    color: Colors.grey),),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                          child: Text(
                                            "",
                                            style: TextStyle(fontSize: DeviceSizeFit.setPx(13),
                                                color: Colors.blue),),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]
              ),
            ]
        )
    );
  }



}

class Sales{
  final String day;
  final int sold;
  final charts.Color color;

  Sales(this.day, this.sold, Color color)
      :this.color=charts.Color(r: color.red,g: color.green, b: color.blue,a: color.alpha);
}

