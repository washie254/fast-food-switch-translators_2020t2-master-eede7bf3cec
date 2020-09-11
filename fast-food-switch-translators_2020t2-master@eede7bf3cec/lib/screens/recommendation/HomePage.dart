import 'package:fastfoodswitch/screens/nutritional_value/nutrition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fastfoodswitch/screens/recommendation/transactionCenter.dart';
import 'package:fastfoodswitch/screens/recommendation/sq_color.dart';

import 'dimens.dart';

class RecommendationScreen extends StatefulWidget {
  static const String id = 'recommendation_screen';
  @override
  RecommendationScreenState createState() => RecommendationScreenState();
}

class RecommendationScreenState extends State<RecommendationScreen>
    with RouteAware {
  @override
  void initState() {
    super.initState();
  }

  String devicesName = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Recommended Food"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: TransactionCenterbean.length,
        itemBuilder: (BuildContext context, int index) {
          return buildModule(context, index);
        },
      ),
    );
  }

  Widget buildModule(BuildContext context, int index) {
    return new Card(
      elevation: 6,
      child: new ListTile(
        leading: new Image.asset(TransactionCenterbean[index]["IconData"]),
        title: new Text(
          TransactionCenterbean[index]["name"],
          style:
              new TextStyle(color: SQColor.darkGray, fontSize: Dimens.dimens16),
        ),
        subtitle: new Text(
          TransactionCenterbean[index]["desc"],
          style: new TextStyle(
              color: SQColor.black_666666, fontSize: Dimens.dimens12),
        ),
        trailing: new Text(
          TransactionCenterbean[index]["price"],
          style: new TextStyle(color: SQColor.red, fontSize: Dimens.dimens12),
        ),
        onTap: () => Navigator.pushNamed(context, NutritionScreen.id),
      ),
    );
  }
}
