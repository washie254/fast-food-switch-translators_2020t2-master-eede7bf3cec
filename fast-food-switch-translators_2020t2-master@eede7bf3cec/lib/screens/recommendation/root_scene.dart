import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodswitch/screens/recommendation/sq_color.dart';

import 'HomePage.dart';
import 'HomePage1.dart';
import 'HomePage2.dart';

class RootScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RootSceneState();
  }
}

class RootSceneState extends State<RootScene> {
  int _tabIndex = 0;
  bool isFinishSetup = false;
  List<Icon> _tabImages;
  List<Icon> _tabSelectedImages;

  bool hasService = true;
  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this._tabIndex);
    _tabImages = [
      new Icon(Icons.home),
      new Icon(Icons.add_circle),
      new Icon(Icons.add_location),
    ];
    _tabSelectedImages = [
      new Icon(Icons.home, color: SQColor.blue),
      new Icon(Icons.add_circle, color: SQColor.blue),
      new Icon(Icons.add_location, color: SQColor.blue),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  PageController pageController;
  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: WillPopScope(
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              body: new IndexedStack(
                index: _tabIndex,
                children: <Widget>[
                  RecommendationScreen(),
                  HomePageScene1(),
                  HomePageScene2(),
                ],
              ),
              bottomNavigationBar: CupertinoTabBar(
                backgroundColor: Colors.white,
                activeColor: SQColor.theme_color,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: getTabIcon(0), title: Text('Home')),
                  BottomNavigationBarItem(
                      icon: getTabIcon(1), title: Text('Home')),
                  BottomNavigationBarItem(
                      icon: getTabIcon(2), title: Text('Home')),
                ],
                currentIndex: _tabIndex,
                onTap: (index) {
                  setState(() {
                    _tabIndex = index;
                  });
                },
              ),
            )),
      ),
    );
  }

  Icon getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }

  void onPageChanged(int page) {
    if (this._tabIndex == page) return;
    setState(() {
      this._tabIndex = page;
    });
  }
}
