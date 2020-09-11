import 'package:flutter/material.dart';

class Feedbackscreen extends StatefulWidget {
  static const String id = 'test';
  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<Feedbackscreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white.withOpacity(0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      FlatButton(
                        color: Colors.blue,
                      child: Text("normal"),
                        onPressed: () {},
                      ),
                      Text("Breakfast",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      FlatButton(
                        color: Colors.blue,
                        child: Text("normal"),
                        onPressed: () {},
                      ),
                      Text("Lunch",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      FlatButton(
                        color: Colors.blue,
                        child: Text("normal"),
                        onPressed: () {},
                      ),
                      Text("Dinner",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      FlatButton(
                        color: Colors.blue,
                        child: Text("normal"),
                        onPressed: () {},
                      ),
                      Text("Snack",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      FlatButton(
                        color: Colors.blue,
                        child: Text("normal"),
                        onPressed: () {},
                      ),
                      Text("Water",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      FlatButton(
                        color: Colors.blue,
                        child: Text("normal"),
                        onPressed: () {},
                      ),
                      Text("Exercise",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              FlatButton(
                color: Colors.blue,
                child: Text("go back"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),]
            )
          ],
        ),
      ),
    );
  }
}