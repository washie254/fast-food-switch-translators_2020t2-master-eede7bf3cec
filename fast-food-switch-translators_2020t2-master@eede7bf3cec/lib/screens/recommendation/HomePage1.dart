import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fastfoodswitch/screens/recommendation/transactionCenter.dart';

class HomePageScene1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePageScene1> with RouteAware {
  @override
  void initState() {
    super.initState();
    TransactionCenters = TransactionCenterbean;
  }

  List<Map> lisChecked = [];
  List<Map> transactionCenterlistShow = [];
  List<Map> hidderCenterList = [];
  List<Map> TransactionCenters = [];
  List<Map> TransactionCentersData = [];
  String devicesName = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Recommended Food"),
      ),
      body: new Text("Recommended Food"),
    );
  }
}
