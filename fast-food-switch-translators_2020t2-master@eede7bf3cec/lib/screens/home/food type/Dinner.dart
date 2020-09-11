import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fastfoodswitch/screens/home/Food detail/food.dart';

class DinnerScreen extends StatefulWidget {
  static const String id = 'Breakfast';
  @override
  _Dinner createState() => _Dinner();
}

class _Dinner extends State<DinnerScreen> {
  final _bottomNavigationColor = Colors.blue;


  List<FoodDetail> food = [
    FoodDetail("Steak", "Monroes", "1 Serving"),
    FoodDetail("Salad", "Monroes", "1 Serving"),
    FoodDetail("Red wine", "Monroes", "100 ml"),
  ];

  Widget foodcardTemplate(food) {
    return Container(
      child: Card(
          child: Container(
            height:70,
            width: 310,
            alignment: Alignment.center,
            color: Colors.white,
            child: ListTile(
              title: Text(food.name),
              subtitle: Text("${food.shopname}, ${food.description}"),
              leading: Icon(Icons.fastfood),
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    //detect screen  size
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    print('width is $width; height is $height');

    var data = [
      Sales("Sun", 50, Colors.red),
      Sales("Mon", 70, Colors.green),
      Sales("Tue", 100, Colors.yellow),
      Sales("Wed", 50, Colors.pink),
      Sales("Thu", 145, Colors.purple),
      Sales("Fri", 190, Colors.brown),
      Sales("Sat", 30, Colors.orange),
    ];

    var series = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.day,
          measureFn: (Sales sales, _) => sales.sold,
          colorFn: (Sales sales, _) => sales.color,
          id: 'Sales',
          data: data,
          labelAccessorFn: (Sales sales, _) =>
          '${sales.day} : ${sales.sold.toString()}')
    ];

    var chart = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(arcWidth: 11),
      animate: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "<NAME>",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.black,
            onPressed: () {},
          ),
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
      body: ListView(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Dinner",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    height: 30.0,
                    thickness: 1.5,
                    indent: 45.0,
                    endIndent: 45,
                    color: Colors.black,
                  ),

                  //search bar
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white, //box color
                        border: Border.all(color: Colors.black12, width: 0.5),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          //shadow
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0, 2),
                              blurRadius: 10.0)
                        ]),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Searchs for items',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                  suffixIcon: GestureDetector(
                                    child: Icon(Icons.search),
                                    onTap: () {},
                                  )),
                              keyboardType: TextInputType.name,
                            )),
                      ],
                    ),
                  ),

                  //graph
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              SizedBox(height: 200, width: 200, child: chart),
                              Column(
                                children: <Widget>[
                                  Text("2000/3000"),
                                  Text("kj"),
                                  Text("Remaining"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),

                  //food card
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        food.map((food) => foodcardTemplate(food)).toList(),
                      )
                    ],
                  ),

                  //add button
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton.icon(icon:Icon(Icons.add),color: Colors.blue,onPressed: (){},label: Text("Add your food"),),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class Sales {
  final String day;
  final int sold;
  final charts.Color color;

  Sales(this.day, this.sold, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
