import 'package:flutter/material.dart';
import 'Settings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              }),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.black, fontFamily: 'Capriola'),
          ),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 120,
                  width: 120,
                  margin: EdgeInsets.only(top: 5),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/images/user image.png'),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              LineAwesomeIcons.pen,
                              color: Colors.black,
                              size: 20,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                child: Text(
                  "         Tom\n123456@gmail",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Capriola',
                  ),
                ),
              )
            ]),
            Card(
                child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
                  title: Text(
                    "My username                      Tom",
                    style: TextStyle(
                      fontFamily: 'Capriola',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Change Your Email",
                    style: TextStyle(
                      fontFamily: 'Capriola',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.contacts,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Change Your Password",
                    style: TextStyle(
                      fontFamily: 'Capriola',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.fastfood,
                    color: Colors.black,
                  ),
                  title: Text(
                    "View history",
                    style: TextStyle(
                      fontFamily: 'Capriola',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.keyboard,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Contact History",
                    style: TextStyle(
                      fontFamily: 'Capriola',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
              ],
            )),
          ],
        ));
  }
}
