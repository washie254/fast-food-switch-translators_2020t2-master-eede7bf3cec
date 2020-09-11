//import 'package:flutter/material.dart';
//import 'package:flutter_appehs/app/login/login_view.dart';
//import 'package:flutter_appehs/app/root_scene.dart';
//import 'package:flutter_appehs/common/sq_color.dart';
//import 'package:flutter_appehs/common/utils/UserInfoUtils.dart';
//import 'package:flutter_appehs/common/utils/sp_util.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:matcher/matcher.dart';
//import 'package:test_api/test_api.dart';
//
//
//final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
//
//class AppScene extends StatelessWidget {
// @override
//  void initState() {
import 'package:flutter/material.dart';
import 'package:fastfoodswitch/screens/recommendation/root_scene.dart';
import 'package:fastfoodswitch/screens/recommendation/sq_color.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppSceneState();
}

class AppSceneState extends State<AppScene> {
  bool isInitModule = false;

  @override
  initState() {
    super.initState();
  }

  Widget body;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recommended',
      theme: ThemeData(
        primaryColor: SQColor.theme_color,
        dividerColor: Color(0xffeeeeee),
        scaffoldBackgroundColor: SQColor.white,
        textSelectionColor: SQColor.white,
        textTheme: TextTheme(bodyText1: TextStyle(color: SQColor.black_333333)),
      ),
      home: RootScene(),
    );
  }
}
